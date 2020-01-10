defmodule BMP do
  def file_header(offset \\ 26) do
    file_type = "BM"

    # Zero for uncompressed files
    file_size = <<0::little-size(32)>>

    # Always Zero
    reserved = <<0::little-size(32)>>

    # Number of bytes before image date
    bitmap_offest = <<offset::little-size(32)>>

    file_type <> file_size <> reserved <> bitmap_offest
  end

  def example_data(width, height) do
    for row <- 1..height, into: <<>> do
      bytes_past = rem(3 * width, 4)
      padding = if bytes_past > 0, do: (4 - bytes_past) * 8, else: 0

      for item <- 1..width, into: <<>> do
        <<100 + 5 * item::little-size(8), 2 * row::little-size(8),
          5 * item + row::little-size(8)>>
      end <> <<0::size(padding)>>
    end
  end

  def win2x_header(width \\ 32, height \\ 100, bits_per_pixel \\ 24) do
    size = <<12::little-size(32)>>
    width_bits = <<width::little-size(16)>>
    height_bits = <<height::little-size(16)>>
    planes = <<1::little-size(16)>>
    bpp = <<bits_per_pixel::little-size(16)>>

    size <> width_bits <> height_bits <> planes <> bpp
  end

  def example_file(width \\ 32, height \\ 100, name \\ "hello.bmp") do
    save_file(name, win2x_header(width, height), example_data(width, height))
  end

  def save_file(filename, header, pixels) do
    File.write!(filename, file_header() <> header <> pixels)
  end
end
