#!/bin/bash

# Копируем файл prometheus.yml
sudo cp /Metrics_Ubuntu/prometheus.yml /etc/prometheus/prometheus.yml

#Перезапускаем службу
systemctl restart prometheus

# Импортируем файл
sudo mv jvm.options /etc/elasticsearch/jvm.options.d

# Копируем файл elasticsearch.yml
sudo cp /Metrics_Ubuntu/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

# Обновляем конфигурацию
sudo systemctl daemon-reload

#Добавляем в автозагрузку
sudo systemctl enable --now elasticsearch.service

# Копируем файл kibana.yml
sudo cp /Metrics_Ubuntu/kibana.yml /etc/kibana/kibana.yml

#Добавляем в автозагрузку
sudo systemctl enable --now kibana.service

#Перезапускаем службу
systemctl restart kibana

#Добавляем в автозагрузку
systemctl enable --now logstash.service

# Копируем файл logstash.yml
sudo cp /Metrics_Ubuntu/logstash.yml /etc/logstash/logstash.yml

# Импортируем файл
sudo mv logstash-nginx-es.conf /etc/logstash/conf.d

#Перезапускаем службу
systemctl restart logstash.service

# Копируем файл filebeat.yml
sudo cp /Metrics_Ubuntu/filebeat.yml /etc/filebeat/filebeat.yml

#Перезапускаем службу
systemctl restart filebeat

#Добавляем в автозагрузку
systemctl enable filebeat

#Запускаем службу
systemctl start grafana-server

#Добавляем в автозагрузку
systemctl enable grafana-server
