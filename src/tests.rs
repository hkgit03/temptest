// failing tests:

#[test]
fn call_cacher_with_different_value() {
    let mut c = Cacher::new(|a| a);
    let v1 = c.value(1);
    assert_eq!(v1, 1);
    let v2 = c.value(2);
    assert_eq!(v2, 2);
}
