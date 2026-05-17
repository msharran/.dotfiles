function psql() {
    # if psql-client pod exists, delete it
    kubectl get pods | grep psql && kubectl delete pod psql
    kubectl run psql --rm -it --restart=Never --image bitnami/postgresql\
        --env="PGPASSWORD=$PGPASSWORD" --env="PGHOST=$PGHOST" --env="PGPORT=$PGPORT" --env="PGUSER=$PGUSER" --env="PGDATABASE=$PGDATABASE" \
        -- psql --set=sslmode=require -w
}
