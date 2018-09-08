use std::collections::HashMap;
use std::collections::hash_map::Entry::*;
use std::hash::Hash;

pub struct Cacher<F, K, V> where F: Fn(K) -> V
{
    calculation: F,
    values: HashMap<K, V>,
}

// K has to implement Copy because it has to be used for checking and then for inserting
impl<F, K, V> Cacher<F, K, V> where F: Fn(K) -> V, K: Eq + Hash + Copy
{
    pub fn new(calculation: F) -> Cacher<F, K, V> {
        Cacher {
            calculation,
            values: HashMap::new(),
        }
    }

    pub fn value(&mut self, arg: K) -> &V {

        // calculate and insert value if not already present
        match self.values.entry(arg) {
            Occupied(_) => (),
            Vacant(ve) => {
                ve.insert((self.calculation)(arg));
                ()
            },
        };

        // return now present value
        self.values.get(&arg).unwrap()
    }
}
