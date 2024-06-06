environments = {
  dev = {
    natasha = {
      kcls = [
        {
          name   = "dev-natasha-kcls-container-svc1-01"
          type   = "container"
          params = {
            key1 = "value1"
            key2 = "value2"
          }
        }
      ]
    }
    db = {
      "" = [
        {
          name   = "dev-db-rdb-01"
          type   = "rdb"
          params = {
            key1 = "value1"
            key2 = "value2"
          }
        }
      ]
    }
  }
  prod = {
    app = {
      "" = [
        {
          name   = "prod-app-container-svc1-01"
          type   = "container"
          params = {
            key1 = "value1"
            key2 = "value2"
          }
        }
      ]
    }
  }
}

