# Операционные системы UNIX/Linux (Базовый).

> При старте работы над проектом просим вас постараться хронометрировать время работы над проектом.
> По завершении работы над проектом просим вас ответить на два вопроса [в этом опросе](https://forms.gle/kheFQ1M3D27UeyeC9)

Установка и обновления системы Linux. Основы администрирования.


## Contents

1. [Chapter III](#chapter-iii) \
    1. [Установка ОС](#part-1-установка-ос)  
    2. [Создание пользователя](#part-2-создание-пользователя)  
    3. [Настройка сети ОС](#part-3-настройка-сети-ос)   
    4. [Обновление ОС](#part-4-обновление-ос)  
    5. [Использование команды  sudo](#part-5-использование-команды-sudo)  
    6. [Установка и настройка службы времени](#part-6-установка-и-настройка-службы-времени)  
    7. [Установка и использование текстовых редакторов](#part-7-установка-и-использование-текстовых-редакторов)  
    8. [Установка и базовая настройка сервиса SSHD](#part-8-установка-и-базовая-настройка-сервиса-sshd)   
    9. [Установка и использование утилит top, htop](#part-9-установка-и-использование-утилит-top-htop)   
    10. [Использование утилиты fdisk](#part-10-использование-утилиты-fdisk)   
    11. [Использование утилиты df](#part-11-использование-утилиты-df)    
    12. [Использование утилиты du](#part-12-использование-утилиты-du)    
    13. [Установка и использование утилиты ncdu](#part-13-установка-и-использование-утилиты-ncdu)    
    14. [Работа с системными журналами](#part-14-работа-с-системными-журналами)     
    15. [Использование планировщика заданий CRON](#part-15-использование-планировщика-заданий-cron)    


## Chapter I


## Part 1. Установка ОС


![install OS](Part 1/cat\ issue.png)
Вывод результата `cat /etc/issue.`

## Part 2. Создание пользователя

![create user](Part 2/Demka 1.png)
#### Создание пользователя

![print passwd](Part 2/Passwd.png)
#### Вывод # `cat /etc/passwd`

![var log](Part 2/Demka 2.png)
#### Proof /var/log

## Part 3. Настройка сети ОС

![Hostname](Part 3/Hostname.png)
#### Hostname установил имя машины user-1

![Timezone](Part 3/TimeZone.png)
#### Временная зона

![IN](Part 3/Interface Network.png)
#### Названия сетевых интерфейсов

* lo - это локальный хост, который не принадлежит ни к какой сети. Только себе так сказать=))
* 127.0.0.1 или localhost
* Доступен локально, предназначен для проверки работы служб

![DhcpClient Get Ip.png](Part 3/DhcpClient Get Ip.png)
#### DHCP - Dynamic Host Configuration Protocol
![gateway.png](Part 3/gateway.png)
![ip.png](Part 3/ip.png)
#### Внешний ip и ip шлюза gateway (gw)


### Static Configure
![Static IP.png](Part 3/Static IP.png)
![Static IP CONF.png](Part 3/Static IP CONF.png)
![dns-2.png](Part 3/dns.png)
#### Статичные данные, конфигурация и проверка работоспособности сети

![PING.png](Part 3/PING.png)
#### PING 1.1.1.1 and ya.ru


## Part 4. Обновление ОС

![UpdateSystem](Part 4/update.png)
#### Update system `apt update && apt dist-upgrade -y`
Флаг -y отвечает за автоматическое принятие/соглашение с системой
![No Have Update](Part 4/No Have update.png)
#### Заключительная проверка



## Part 5. Использование команды **sudo**

![SudoPart5](Part 5/Part 5.png)
#### Proof sudo

* Sudo - предназначен для полученя root прав. Опасно использовать и запускать неизвестные файлы


## Part 6. Установка и настройка службы времени
![timezone](Part 6/timezone.png)
#### Time Zone. Часовой пояс

## Part 7. Установка и использование текстовых редакторов 
* Были использованы редакторы Nano, VIM, MCEDIT
####  Создание и ввод запииси
![vim.png](Part 7/vim.png)
![nano.png](Part 7/nano.png)
![mcedit.png](Part 7/mcedit.png)

* Edit with VIM
#### ДО
![edit text VIM.png](Part 7/edit text VIM.png)
#### После
![after edit in VIM.png](Part 7/after edit in VIM.png)

* Edit with Nano
![edit text NANO.png](Part 7/edit text NANO.png)
![after edit in NANO.png](Part 7/after edit in NANO.png)

* Edit with MCEDIT
![edit text MCEDIT.png](Part 7/edit text MCEDIT.png)
![after edit in MCEDIT.png](Part 7/after edit in MCEDIT.png)

##### Result text 
![result ls text.png](Part 7/result ls text.png)

**== Search ==**
* Nano
![nano search.png](Part 7/nano search.png)
![replace Nano.png](Part 7/replace Nano.png)
#### CTRL + W - Text // Search
#### CTRL + \\ - Text and Replace // Reaplce

* VIM
![vim search.png](Part 7/vim search.png)
![replace in VIM-1.png](Part 7/replace in VIM-1.png)
#### /search text
#### s/text/replace/g

* MCEDIT
![search in MCEDIT.png](Part 7/search in MCEDIT.png)
![Replace in MCEDIT.png](Part 7/Replace in MCEDIT.png)
#### Потыкал кнопки прям там, на скриншоте видны

**== Result ==**
![result finish.png](Part 7/result finish.png)


## Part 8. Установка и базовая настройка сервиса **SSHD**

* Install and autostart SshD
![installAndPort.png](Part 8/install and autostart sshD.png)

#### Change Port 
![change port.png](Part 8/change port and listen all.png)

#### там проброс портов на уровне VB сделан и подключаюсь по 3022
![Proof and connect server with change port.png](Part 8/Proof and connect server with change port.png)

#### Ps and netstat listen
![Ps and netstat listen.png](Part 8/Ps and netstat listen.png)


* Netstat -tan 
  1. t - tcp
  2. a - all socket
  3. n - вывод вместо адресов ip
* PS -fC 
  1. f - full format
  2. C - command name

### 0.0.0.0/0 Все ip и все порты. Органичений нет

## Part 9. Установка и использование утилит **top**, **htop**

![tools top.png](Part 9/tools top.png)
  1. uptime - 11 min
  2. количество авторизованных пользователей - 2
  3. общую загрузку системы - 0.00
  4. общее количество процессов - 100
  5. загрузку cpu - 0.0
  6. загрузку памяти - 329.2
  7. pid процесса занимающего больше всего памяти - 654 (скрин ниже)
  8. pid процесса, занимающего больше всего процессорного времени - 1275 (скрин ниже)

#### PID Memory
![Top Memory.png](Part 9/Top Memory.png)

#### PID CPU
![cpu.png](./cpu.png)

### HTOP

1. ![PID.png](Part 9/PID.png)
2. ![PERCENT_CPU.png](Part 9/PERCENT_CPU.png)
3. ![PERCENT_MEM.png](Part 9/PERCENT_MEM.png)
4. ![TIME.png](Part 9/TIME.png)
5. ![search syslog f3.png](Part 9/search syslog f3.png)
6. ![F4 sort.png](Part 9/F4 sort.png)
7. ![add poeben F2.png](Part 9/add poeben F2.png)

## Part 10. Использование утилиты **fdisk**

```text
Disk /dev/sda: 10 GiB, 10737418240 bytes, 20971520 sectors
Disk model: VBOX HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 56467903-2820-4F84-BEFD-3A86174DF5E4


 название жесткого диска - /dev/sda
 Размер - 10GiB
 Sectors - 20971520
```

#### Fdisk
 ![fdisk.png](Part 10/fdisk.png)

#### Swap
![free -h.png](Part 10/free -h.png)


## Part 11. Использование утилиты **df** 

![Снимок экрана 2022-06-14 в 3.01.24 AM.png](Part 11/Снимок экрана 2022-06-14 в 3.01.24 AM.png)

```text
 du / 
размер раздела - 9336140
размер занятого пространства - 4403780
размер свободного пространства - 4438384
процент использования - 50 %

------
du -Th

размер раздела - 9.0G
размер занятого пространства - 4.2G
размер свободного пространства - 4.3G
процент использования - 50% 
```

## Part 12. Использование утилиты **du**


#### Все в одном скрине
![du.png](Part 12./du.png)

## Part 13. Установка и использование утилиты **ncdu**

* /home
![home.png](Part 13/home.png)

* /var
![var.png](Part 13/var.png)

* /var-log
![var - log.png](Part 13/var - log.png)

* ncdu install 
![ncdu.png](Part 13/ncdu.png)


## Part 14. Работа с системными журналами

#### Время успешной авторизации Jun 13 21:02:03  authority=local


#### Log Restart SshD
![restart sshd.png](Part 14/restart sshd.png)


## Part 15. Использование планировщика заданий **CRON**

#### Syslog
![syslog crontab.png](Part 15/syslog crontab.png)

#### Task
![task.png](Part 15/task.png)

#### List Task
![list task.png](Part 15/list task.png)

#### Del Task Cron
![del task cron.png](Part 15/del task cron.png)


