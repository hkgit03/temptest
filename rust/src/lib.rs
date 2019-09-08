use alloc::boxed::Box;
static FOO: Box<u32> = Box::new(10);

#[cfg(test)]
mod tests {

    #[test]
    fn test_private () {
        crate::do_private_stuff("This is a unit test");
        crate::do_stuff("This is a unit test");
    }

    #[test]
    fn test () {
        crate::do_stuff("This is a unit test");
    }
}

#[allow(dead_code)]
#[allow(unused_variables)]
fn do_private_stuff(s: &'static str) {
    println!("{}", FOO.leak());
    panic!(s);
}

#[allow(dead_code)]
#[allow(unused_variables)]
pub fn do_stuff(s: &'static str) {
    println!("{}", FOO.leak());
    panic!(s);
}
