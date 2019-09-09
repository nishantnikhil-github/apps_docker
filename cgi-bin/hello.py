#!/usr/bin/python

from flask import Flask, render_template, request, jsonify, redirect, url_for, session, flash, send_file, send_from_directory
from werkzeug import secure_filename
import collections
import MySQLdb
from crypt import methods
import os
from flask.globals import request
import logging
import yaml
from datetime import date, timedelta

app =Flask(__name__)

@app.route('/login')
def login():
    return render_template("login.html")
