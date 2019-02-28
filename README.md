# Build Docker Image

```bash
$ docker build -t zephir .
```

# Init Project
```bash
$ docker run --rm -it -v $(pwd)/test:/project zephir init hello
```

# Create Test File

Following code must be placed in test/hello/hello.zep:

```php
namespace Hello;

class Hello
{
    public static function say()
    {
        echo "Hello World!" . PHP_EOL;
    }
}
```

# Build Project
```bash
$ docker run --rm -it -v $(pwd)/test/hello:/project zephir build
```

# Test Extension
```bash
$ docker run --rm --entrypoint 'php' -it -v $(pwd):/project zephir -dextension=/project/test/hello/ext/modules/hello.so -r "echo Hello\Hello::say();"
```