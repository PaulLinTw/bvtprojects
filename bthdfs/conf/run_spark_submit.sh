cd /usr/local/spark
./bin/spark-submit \
  --master spark://hdmaster1:7077 \
  --files=/usr/local/spark/conf/metrics.properties \
  --conf spark.metrics.conf=metrics.properties \
  /home/vagrant/share/test.py
