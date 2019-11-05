Подключение к удаленной машине .
  ssh.exe -i C:/Users/m.m.fatkhutdin/.ssh/dwh.pem -l centos 10.216.200.141 .

Запускаем source .
  [centos@cicd-manager DWDO-720]$ source ./etl_cicd/ansible/dwh-openrc.sh .

Запускаем плейбук .
  ./run-playbook.sh playbooks/create_test.yml 
  ./run-playbook.sh playbooks/delete_test.yml 


cd /opt/cicd/DWDO-720/etl_cicd/ansible/playbooks
cd /opt/cicd/DWDO-720/ansible/roles/openstack/tasks/

/opt/cicd/DWDO-720/ansible/roles/openstack/file/tinkoff-cloud.crt