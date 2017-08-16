require 'exif'

describe Exif do
  it 'works' do
    data = Exif::Data.new(File.expand_path('../sample.jpg', __FILE__))
    expect(data.model).to eq 'NIKON D600'
    expect(data.image_width).to eq 4000
    expect(data.bits_per_sample).to eq [8, 8, 8]
    expect(data.gps_latitude).to eq [Rational(24, 1), Rational(106817, 10000), Rational(0, 1)]
    expect(data.gps_time_stamp).to eq [Rational(8, 1), Rational(4, 1), Rational(25, 1)]
    expect(data.gps_altitude).to eq Rational(332, 1)
    expect(data.pixel_x_dimension).to eq 4000
    expect(data.gps_version_id).to eq "\x02\x02\x00\x00"
    expect(data.gps_altitude_ref).to eq "\x00"
    expect(data.date_time).to eq Time.new(2013,12,8,21,14,11)
    expect(data.date_time_original).to eq Time.new(2013,9,10,16,31,21)
    expect(data.gps_date_stamp).to eq Time.new(2013,9,10)
  end

  it 'works with an IO object' do
    file_path = File.expand_path('../sample.jpg', __FILE__)
    io = File.new(file_path)
    data = Exif::Data.new(io)
    expect(data.model).to eq 'NIKON D600'
  end

  it 'raises errors' do
    expect{ Exif::Data.new(File.expand_path('../not_readable.jpg', __FILE__)) }.to raise_error(Exif::NotReadble)
  end
end