DESTDIR=Results

docker-compose build

echo "starting the containers..."
docker-compose up -d
echo "http://localhost:9870 for HDFS"
echo "http://localhost:8088 for YARN"

echo "running the sentiment analysis on movie reviews..."
docker exec master /etc/runall.sh

echo "getting the results..."
rm -rf $(DESTDIR)
docker cp master:/cloudmesh/python/output_pos_tagged ./$(DESTDIR)
docker cp master:/cloudmesh/python/output_neg_tagged ./$(DESTDIR)
docker cp master:/cloudmesh/python/log.txt ./$(DESTDIR)
cp docker-compose.yml ./$(DESTDIR)