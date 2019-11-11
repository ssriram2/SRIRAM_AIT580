#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Nov 10 16:02:15 2019

@author: sumanth
"""

#Student Name : Sriram Sai Sumanth
#G Number :01230629

from bs4 import BeautifulSoup
import urllib
import csv
import requests
import pandas as pd
import csv
import xlrd
import matplotlib.pyplot as plt
import numpy as np
import datetime

url = requests.get('https://repo.vse.gmu.edu/ait/AIT580/580books.html')
soup = BeautifulSoup(url.content,'html.parser')
listitems = soup.find_all('li')
filename = "python_books.csv"
f = open(filename, "w")
headers = "Title, Author(s), Publisher, Release Date\n"
f.write(headers)

for entry in listitems:
    
    title = entry.a.booktitle.text
    title = title.replace(",", "|")
    author = entry.author.text
    author = author.replace(",", "|")
    publisher = entry.publisher.text
    publisher = publisher.replace(",", "|")
    release = entry.release.text
    release = release.replace(",", "|")
   
    f.write(title + "," + author + "," + publisher + "," + release + "\n")

f.close()

for record in soup.findAll('tr'):
    tbltxt = ""
    for data in record.findAll('td'):
        tbltxt = tbltxt + data.text + ","
    print(tbltxt)
    print(tbltxt[0:-1])
df=pd.read_csv("~/Downloads/python_books.csv")
data=df[' Publisher'].value_counts()
print(data)
data.plot(kind='bar')
plt.xlabel('PUBLISHER')
plt.ylabel('COUNT')
plt.title('publisher column visualization')
plt.show()
df['year'] = pd.DatetimeIndex(df[' Release Date']).year
data1=df['year'].value_counts()
print(data1)
data1.plot(kind='bar')
plt.xlabel('YEAR')
plt.ylabel('FREQUENCY')
plt.title('visulization for year')
plt.show()


