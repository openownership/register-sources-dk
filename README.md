# Register Sources DK

Register Sources DK is a shared library for the [OpenOwnership](https://www.openownership.org/en/) [Register](https://github.com/openownership/register) project.
It is designed for use with the beneficial ownership data in the Central Business Register published by the Danish Business Authority in Denmark

The primary purposes of this library are:

- Providing typed objects for the JSON-line data. It makes use of the dry-types and dry-struct gems to specify the different object types allowed in the data returned.
- Persisting the DK records using Elasticsearch. This functionality includes creating a mapping for indexing the possible fields observed as well as functions for storage and retrieval.

## Installation

Install and boot [Register](https://github.com/openownership/register).

Configure your environment using the example file:

```sh
cp .env.example .env
```

## Testing

Run the tests:

```sh
docker compose run sources-dk test
```
