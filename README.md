# Heroes-Rest-Api

## Hero Manager

This browser application is a 'Hero Manager' - it allows a user to view, create, delete and update heroes. It will make HTTP requests to http://localhost:8888 to fetch and manipulate hero data. The application 
```Heroes-Rest-Api``` respond to those requests.

 Open [Hero Manager](http://aqueduct-tutorial.stablekernel.io/#/dashboard)

## Running the Application Locally

Run `aqueduct serve` from this directory to run the application. For running within an IDE, run `bin/main.dart`. By default, a configuration file named `config.yaml` will be used.

To generate a SwaggerUI client, run `aqueduct document client`.

## References

- postgreql version 12.4 Windows x86-64	
- Aqueduct CLI Version: 4.0.0-b1
- Aqueduct project version: 4.0.0-b1
- Dart SDK version: 2.10.2 (stable) "windows_x64"

**pubspec.yaml**

```yaml
version: 0.0.1
environment:
  sdk: ">=2.0.0 <3.0.0"
dependencies:
  aqueduct: ^4.0.0-b1
dev_dependencies:
  test: 
  aqueduct_test: 
```

## Running Application Tests

To run all tests for this application, run the following in this directory:

```
pub run test
```

The default configuration file used when testing is `config.src.yaml`. This file should be checked into version control. It also the template for configuration files used in deployment.

## Deploying an Application

See the documentation for [Deployment](https://aqueduct.io/docs/deploy/).