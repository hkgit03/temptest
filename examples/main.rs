extern crate temptest;
use temptest::*;
use std::path::Path;

fn main(){
    #[allow(unused_variables)]
    let pic_grey: Vec<Vec<Vec<u8>>> = vec![
        vec![ vec![200], vec![55], vec![255] ],
        vec![ vec![255], vec![88], vec![200] ] ];
    #[allow(unused_variables)]
    let pic_rgb: Vec<Vec<Vec<u8>>> = vec![
        vec![ vec![80, 100, 120], vec![22, 50, 100], vec![200, 40, 150] ],
        vec![ vec![200, 40, 200], vec![22, 0, 100], vec![80, 100, 140] ] ];
    #[allow(unused_variables)]
    let pic_rgb2: Vec<Vec<Vec<u8>>> = vec![
        vec![ vec![80, 100, 120], vec![22, 50, 100], vec![200, 40, 150] ],
        vec![ vec![200, 40, 200, 22, 0, 100], vec![80, 100, 140] ] ];
    #[allow(unused_variables)]
    let pic_rgb3: Vec<Vec<Vec<u8>>> = vec![
        vec![ vec![80, 100, 120, 22, 50, 100], vec![200, 40, 150] ],
        vec![ vec![200, 40, 200], vec![22, 0, 100], vec![80, 100, 140] ] ];
    #[allow(unused_variables)]
    let pic_rgba: Vec<Vec<Vec<u8>>> = vec![
        vec![ vec![80, 100, 120, 0], vec![22, 50, 100, 64], vec![200, 40, 150, 128] ],
        vec![ vec![200, 40, 200, 128], vec![22, 0, 100, 196], vec![80, 100, 140, 255] ] ];
    let out_name = "/home/laerling/temp/temp.png";
    let out_path = Path::new(out_name);
    if let Err(e) = write_pic(pic_rgb2, &out_path) {
        panic!(e.as_str());
    }
    println!("Wrote output to {:?}", out_path)
}
