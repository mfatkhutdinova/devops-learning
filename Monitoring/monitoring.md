# Monitoring

**Monitoring** - информация о части системы в определенное время:
- CPU Utilization
- Disk Space
- Кол-во файлов в директории /myfiles
- Кол-во ошибок http 404 за последние 5 минут
- Кол-во запросов http GET за последние 5 минут

### Для чего нужен Monitoring?
- Нужен для помощи в Debugging
- Можно видеть состояние системы до, во время, после проблемы
- Нужен, чтобы видеть тренд проблемы и приближащиеся проблемы
- Нужен для автоматизации

## Monitoring System Types
**Push**:
- На клиент серверах установлен Monitoring Agent
- Этот Monitoring Agent собирает данные о системе
- Этот Monitoring Agent посылает данные на Monitoring Server

**Pull**:
- На клиент серверах установлен Monitoring Agent
- Этот Monitoring Agent собирает данные о системе
- Этот Monitoring Agent никуда ничего не посылает
- Этот Monitoring Agent делает данные доступными на месте доступа
- Monitoring Server собирает доступные данные из мест доступа

Prometheus работает по системе Pull.

## Monitoring vs Observability
**Monitoring**:  
- процесс сбора данных и создания отчетов по различным показателям, определяюшим работоспособность системы
- мониторинг - это сбор данных об отдельных компонентах

**Observability**:  
- исследовательский процесс, он изучает взаимодействие комнонетов распределенной системы и данные, собранные в ходе мониторинга, чтобы найти основную причину проблем (root cause)

## Prometheus

**Prometheus** - бесплатная система мониторинга и оповещения.  
Собирает и хранит метрики в виде данных Time Series в TSDB (Time Series Data Base), т.е. информация о метриках сохраняется с отметкой времени, в которой была записана.  

**Exporter** - Monitoring Agent в Prometheus.  
Есть огромное кол-во готовых Exporters официальных и third-party:

| Название Prometheus Exporter |        Что мониторит        | 
|------------------------------|-----------------------------|
| Node Exporter                | Мониторинг Linux серверов   | 
| Windows Exporter             | Мониторинг Windows серверов | 
| MySQL Server Exporter        | Мониторинг MySQL серверов   | 
| Apache Exporter              | Мониторинг Apache серверов  |
| NVIDIA GPU Exporter          | Мониторинг NVIDIA GPU       |

### Prometheus Metrics
- После того, как вы устанавливаете и запускаете Exporter, все метрики, которые он мониторинг и собирает, будут доступны ккак Web страничка под определенным HTTP портом
- Например, Node Exporter:
    - если Private IP вашего сервера 10.0.0.1
    - Node Exporter публикует все метрики на HTTP Port 9100
    - По адресу http://10.0.0.1:9100 будет информация об Exporter
    - По адресу http://10.0.0.1:9100/metrics будут сами метрики
 
### Prometheus Main Files and Folders 
```
data/
prometheus - binary file
prometheus.yaml
```

**PromQL** - Prometheus Query Language.   


