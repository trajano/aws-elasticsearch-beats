AWS ElasticSearch Beats
=======================
This is a mostly-preconfigured Filebeats that is setup to read the Docker logs to be sent to AWS ElasticSearch.

## Docker Swarm usage

    version: "3.5"
    services:
      filebeat:
        image: trajano/aws-elasticsearch-beats
        environment:
          # just the hostname portion the following is an example
          AWS_ELASTICSEARCH_HOSTNAME: vpc-trajano-owe5rf7krqeblvziqykhrj3xcm.ca-central-1.es.amazonaws.com
        # read only access to the /var/lib/docker/containers folder which contain the logs
        volumes:
        - /var/lib/docker/containers:/var/lib/docker/containers:ro
        deploy:
          # so it will be deployed to every node
          mode: global
          restart_policy:
            condition: any
            delay: 10s
          resources:
            limits:
            memory: 32M  
