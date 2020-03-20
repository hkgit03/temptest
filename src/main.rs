use std::env;
use std::fs;
use std::vec::Vec;

fn main() {
    let filename = env::args().nth(1).expect("Too few arguments");
    let p = fs::read(filename).expect("Can't read file");

    // init
    let plen = p.len();
    let mut ip = 0;
    let mut ip_stack: Vec<usize> = Vec::with_capacity(25);
    let mut t: Vec<u8> = vec![0; 10];
    let mut tp = 4;
    let amount_of_new_cells = 10;
    let mut ic = 0;

    // execute
    while ip < plen {
        let _old_ip = ip;
        let cmd = p[ip];
        ic += 1;
        match cmd as char {

            '<' => {
                if tp == 0 {
                    // extend tape to the left
                    let mut t2 = Vec::with_capacity(t.capacity() + amount_of_new_cells);
                    t2.append(&mut vec![0; amount_of_new_cells]);
                    t2.append(&mut t);
                    t = t2;

                    // adjust tape pointer
                    tp += amount_of_new_cells;
                }
                tp -= 1;
            },

            '>' => {
                if tp == t.len()-1 {
                    // extend tape to the right
                    let mut t2 = Vec::with_capacity(t.capacity() + amount_of_new_cells);
                    t2.append(&mut t);
                    t2.append(&mut vec![0; amount_of_new_cells]);
                    t = t2;
                }
                tp += 1;
            },

            '+' => {
                if t[tp] == 255 {
                    t[tp] = 0;
                } else {
                    t[tp] += 1;
                }
            },

            '-' => {
                if t[tp] == 0 {
                    t[tp] = 255;
                } else {
                    t[tp] -= 1;
                }
            },

            '[' => {
                if t[tp] != 0 {
                    ip_stack.push(ip);
                } else {
                    // scan to corresponding closing bracket
                    let mut loops = 1;
                    while loops > 0 {
                        ip += 1;
                        if p[ip] as char == '[' { loops += 1; }
                        if p[ip] as char == ']' { loops -= 1; }
                    }
                }
            },

            ']' => {
                if t[tp] != 0 {
                    //println!("");
                    //println!("ip={} tp={} cmd='{}'", _old_ip, tp, cmd as char);
                    //print!("ip_stack:");
                    //for x in &ip_stack {
                    //    print!(" {}", x);
                    //}
                    //println!("");
                    //print!("tape:");
                    //for x in &t {
                    //    print!(" {}", x);
                    //}
                    //println!("");
                    ip = ip_stack[ip_stack.len()-1]
                } else {
                    ip_stack.pop();
                }
            },

            '.' => print!("{}", t[tp] as char),

            ',' => println!("{} UNIMPLEMENTED", cmd),

            _ => (),
        }

        //println!("");
        //println!("ip={} tp={} cmd='{}'", _old_ip, tp, cmd as char);
        //print!("ip_stack:");
        //for x in &ip_stack {
        //    print!(" {}", x);
        //}
        //println!("");
        //print!("tape:");
        //for x in &t {
        //    print!(" {}", x);
        //}
        //println!("");

        ip += 1;
    }

    println!("Executed {} instructions", ic);
}
