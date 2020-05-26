from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy
# from sqlalchemy import UniqueConstraint

ma = Marshmallow()
db = SQLAlchemy()


class User(db.Model):
    __tablename__ = 'users'
    # __table_args__ = tuple(db.UniqueConstraint('id', 'username', name='my_2uniq'))
    id = db.Column(db.Integer, primary_key=True)
    api_key = db.Column(db.String(), primary_key=True)
    username = db.Column(db.String(), primary_key=True, unique=True)
    first_name = db.Column(db.String())
    last_name = db.Column(db.String())
    password = db.Column(db.String())
    email = db.Column(db.String())

    def __init__(self, id, api_key, username, first_name, last_name, password, email):
        # db.drop_all()
        # db.create_all()
        self.id = id
        self.api_key = api_key
        self.username = username
        self.first_name = first_name
        self.last_name = last_name
        self.password = password
        self.email = email

    def __repr__(self):
        return f'id {self.id}'

    def serialize(self):
        return {
            'id': self.id,
            'api_key': self.api_key,
            'username': self.username,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'password': self.password,
            'email': self.email
        }


class UserSchema(ma.Schema):
    id = fields.String()
    api_key = fields.String()
    username = fields.String(required=True, validate=validate.Length(1))
    firstname = fields.String(required=True, validate=validate.Length(1))
    lastname = fields.String(required=True, validate=validate.Length(1))
    password = fields.String(required=True, validate=validate.Length(1))
    email = fields.String(required=True, validate=validate.Length(1))
