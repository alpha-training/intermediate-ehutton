use kdb::types::{K, KError};

/// This is the Rust function that will be exposed to q.
/// It is designed to be a robust equivalent of q's `reverse`.
#[kdb::function]
fn rustReverse(list: K) -> Result<K, KError> {
    
    // This `match` is the Rust equivalent of C's `switch(x->t)`.
    // It is required to handle all the different kdb+ list types.
    match list {
        // --- Handle Simple Vectors (Types 4h-19h) ---
        // The (mut v) pattern moves the list data into a new Rust vector `v`.
        // We then call Rust's built-in, fast .reverse() on it.
        K::ByteVector(mut v) => { v.reverse(); Ok(K::ByteVector(v)) },
        K::ShortVector(mut v) => { v.reverse(); Ok(K::ShortVector(v)) },
        K::IntVector(mut v) => { v.reverse(); Ok(K::IntVector(v)) },
        K::LongVector(mut v) => { v.reverse(); Ok(K::LongVector(v)) },
        K::RealVector(mut v) => { v.reverse(); Ok(K::RealVector(v)) },
        K::FloatVector(mut v) => { v.reverse(); Ok(K::FloatVector(v)) },
        K::SymbolVector(mut v) => { v.reverse(); Ok(K::SymbolVector(v)) },
        K::TimestampVector(mut v) => { v.reverse(); Ok(K::TimestampVector(v)) },
        K::MonthVector(mut v) => { v.reverse(); Ok(K::MonthVector(v)) },
        K::DateVector(mut v) => { v.reverse(); Ok(K::DateVector(v)) },
        K::DatetimeVector(mut v) => { v.reverse(); Ok(K::DatetimeVector(v)) },
        K::TimespanVector(mut v) => { v.reverse(); Ok(K::TimespanVector(v)) },
        K::MinuteVector(mut v) => { v.reverse(); Ok(K::MinuteVector(v)) },
        K::SecondVector(mut v) => { v.reverse(); Ok(K::SecondVector(v)) },
        K::TimeVector(mut v) => { v.reverse(); Ok(K::TimeVector(v)) },
        // K::CharVector ("hello") is just an alias for K::ByteVector
        
        // --- Handle Generic Lists (Type 0h) ---
        // This handles mixed lists like (1; 2.0; `a)
        K::List(mut k_list) => {
            // k_list is a `KList` struct that holds a `Vec<K>`
            k_list.reverse();
            Ok(K::List(k_list))
        },

        // --- Handle Atoms (Types -1h to -19h) ---
        // q's `reverse` on an atom (e.g., `reverse 10`) just returns the atom.
        // This `atom` pattern catches all other enum variants.
        atom => Ok(atom),
    }
}