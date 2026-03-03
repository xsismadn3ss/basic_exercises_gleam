//// Ejercicio 10: Conversión de Temperaturas

/// Define un tipo para representar las unidades de temperatura
pub type TempUnit {
  Celsius
  Fharenheit
  Kelvin
}

/// Representa una temperatura con su valor y unidad
pub type Temperature {
  Temperature(value: Float, unit: TempUnit)
}

fn celcius_to_fharenheit(value: Float) -> Float {
  { value *. 9.0 /. 5.0 } +. 32.0
}

fn celcius_to_kelvin(value: Float) -> Float {
  value +. 273.15
}

fn kelvin_to_celcius(value: Float) -> Float {
  value -. 273.15
}

fn fharenheit_to_celcius(value: Float) -> Float {
  { value -. 32.0 } *. { 5.0 /. 9.0 }
}

/// Convierte una temperatura a celsius
pub fn to_celsius(temp: Temperature) -> Temperature {
  case temp {
    Temperature(_, Celsius) -> temp
    Temperature(value, Fharenheit) -> {
      let value = value |> fharenheit_to_celcius
      Temperature(value, Celsius)
    }
    Temperature(value, Kelvin) -> {
      let value = value |> kelvin_to_celcius
      Temperature(value, Celsius)
    }
  }
}

/// Convierte una temperatura a fharenheit
pub fn to_fharenheit(temp: Temperature) -> Temperature {
  case temp {
    Temperature(_, Fharenheit) -> temp
    Temperature(value, Celsius) -> {
      let value = value |> celcius_to_fharenheit
      Temperature(value, Fharenheit)
    }
    Temperature(value, Kelvin) -> {
      let value = value |> kelvin_to_celcius |> celcius_to_fharenheit
      Temperature(value, Fharenheit)
    }
  }
}

/// Convierte una temperatura a kelvin
pub fn to_kelvin(temp: Temperature) -> Temperature {
  case temp {
    Temperature(_, Kelvin) -> temp
    Temperature(value, Celsius) -> {
      let value = value |> celcius_to_kelvin
      Temperature(value, Kelvin)
    }
    Temperature(value, Fharenheit) -> {
      let value = value |> fharenheit_to_celcius |> celcius_to_kelvin
      Temperature(value, Kelvin)
    }
  }
}
