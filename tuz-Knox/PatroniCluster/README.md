# Что я бы доделал
	1. Хотелось бы добавить более легкую масштабируемость, так как при 3 серверах равзернется легко, а при больших придется вручную менять конфиги. Не знаю нужно ли было реализовать в данном 'релизе', но добавлю в следующих
    
    2. Более Гибкую конфигурацию в самом Patroni

    3. Возможность установки PgBouncer / HaProxy 
    
    4. Добавить сервисы хранилища значений типа ключ:значение (Consul, ZooKeeper ...)
    
Можно было бы playbook разбить на 2 части, для запуска отдельно в etcd и отдельно patroni.

```console
foo@bar:~$ ansible-playbook playbooks/install.yml --ask-vault-pass 
```
пароль офф ваш сайт без https://