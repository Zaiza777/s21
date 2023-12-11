from selenium import webdriver
import json
import requests
import time
import random
import zipfile
import os

file_json = requests.get("https://caduceus.site/product_links/export")
link_list = json.loads(file_json.text)

#Для Selenoid'а
capabilities = {
    "browserName": "chrome",
    "browserVersion": "91.0",
    "selenoid:options": {
        "enableVNC": True,
        "enableVideo": False
        }
    }


driver = webdriver.Remote(command_executor="http://localhost:4444/wd/hub", desired_capabilities=capabilities)
driver.set_window_size(1920, 1080)
##################

# Открываем нужные файлы
if os.path.exists('./result_done.zip'): os.remove('./result_done.zip') 
jungle_zip = zipfile.ZipFile('./result_done.zip', 'a')

def papa_rimski(key, url):
    
    try:
        driver.get(url)
        f = open('./file/' + key, 'w') # Открываем файл по нумерации =)
        f.write(driver.page_source) #Записываем
        print('Save:', key) # По идее не нужная фигня
        # driver.quit()
        f.close 

        jungle_zip.write('./file/' + key, compress_type=zipfile.ZIP_DEFLATED)
        os.remove('./file/' + key) # Удаляет файлы из папки file. Т.к. все скаченные файлы помещяются в архив. Можешь просто закомитить
    except:
        print('Упссс...., что-то пошло не так! :((')


for key, url_for in link_list.items():
    time.sleep(random.randint(2, 5)) # Без этого зависает именно на 135 сайте. Ну сам сайт под ключем 135 может быть любой
    papa_rimski(key, url_for)
