import gleam/string

pub fn message(log_line: String) -> String {
  let out = case log_line {
    "[ERROR]: " <> rest -> rest
    "[WARNING]: " <> rest -> rest
    "[INFO]: " <> rest -> rest
    _ -> "unknown log event"
  }
  string.trim(out)
}

pub fn log_level(log_line: String) -> String {
  let out = case log_line {
    "[ERROR]: " <> _ -> "error"
    "[WARNING]: " <> _ -> "warning"
    "[INFO]: " <> _ -> "info"
    _ -> "unknown log event"
  }
  string.trim(out)
}

pub fn reformat(log_line: String) -> String {
  string.trim(message(log_line))
  <> " ("
  <> string.trim(log_level(log_line))
  <> ")"
}
