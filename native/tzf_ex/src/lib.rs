use lazy_static::lazy_static;
use tzf_rs::DefaultFinder;

lazy_static! {
    static ref FINDER: DefaultFinder = DefaultFinder::new();
}

#[rustler::nif]
fn get_timezone_for_location(lat: f64, lng: f64) -> String {
    String::from(FINDER.get_tz_name(lng, lat))
}

rustler::init!("Elixir.TzfEx");
