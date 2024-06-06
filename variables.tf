variable "environments" {
  description = "Map of environments and their sub-environments with objects."
  type = map(
    map(
      map(
        list(object({
          name   = string
          type   = string
          params = map(string)
        }))
      )
    )
  )
}

