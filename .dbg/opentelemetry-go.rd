# example
{
    # dice
    {
        # console exporter
        go run .

        # jaeger exporter
        {
            # grpc
            OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317 go run .
            # http
            OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4318 go run .
        }

        curl http://localhost:8080/rolldice
    }

    # prometheus
    {
        go run .
    }

    # jaeger
    {
        docker run \
               --name jaeger \
               -e COLLECTOR_OTLP_ENABLED=true \
               -p 16686:16686 \
               -p 4317:4317 \
               -p 4318:4318 \
               -d jaegertracing/all-in-one:1.52

        http://192.168.56.106:16686
    }
}
