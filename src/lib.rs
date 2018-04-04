extern crate lodepng;
use lodepng::encode_file;
use lodepng::ffi::ColorType;
use lodepng::ffi::Error;
use std::path::Path;

pub fn write_pic(pic: Vec<Vec<Vec<u8>>>, filepath: &AsRef<Path>) -> Result<(), Error> {
    // prepare
    let height = pic.len();
    let width = pic[0].len();
    let channels: u32 = pic[0][0].len() as u32;
    let pic_flattened: Vec<u8> = pic.iter()
        .flat_map(|x| x.iter().flat_map(|x| x))
        .map(|&x| x).collect();

    // write
    encode_file(
        filepath,
        &pic_flattened,
        width, height,
        match channels {
            1 => ColorType::GREY,
            3 => ColorType::RGB,
            4 => ColorType::RGBA,
            _ => panic!("Bad amount of channels: {}", channels),
        },
        8
    )
}
