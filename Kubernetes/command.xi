Create .
  kubectl create -f file.yaml - создание объекта из файла 
  kubectl apply -f file.yaml - создание или обновление объекта из файла 
  kubectl run --image imgae_name:tag name [command] - создание деплоймента из cli

Interact .
  kubectl exec -t -i pod_name command - выполнение команды внутри пода
  kubectl logs pod_name - просмотр логов 

List .
kubectl get [pod|replicaset|deployment|...] - получение списка объектов
kubectl describe [pod|replicaset|deployment|...] - получение описания объекта и событий по нему 

Clean up .
kubectl edit [pod|replicaset|deployment|...] object_name - изменение объекта на лету
kubectl set image [pod|replicaset|deployment|...] container=image:tag - обновление имаджа
kubectl cp ns/pod_name:.etc/config.conf config.conf - копирование файла из контейнера

Get Help .
kubectl [command] --help  - получение описания команды, примеров использования и опций 
kubectl help - получение списка доступных команд 
kubectl explain [pod|replicaset|deployment|...] - получение описания объекта определенного типа

Основы работы с Helm .
  helm search - поиск чарта 
  helm install - установка чарта 
  helm upgrade - обновление чарта 
  helm get - скачать чарт
  helm show - показать инфу о чарте 
  helm list - список утсановленных чартов 
  helm uninstall - удалить чарт 