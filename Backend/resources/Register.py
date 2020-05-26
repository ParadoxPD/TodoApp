import string
import random
from flask import request
import json
from flask_restful import Resource
from Models import db, User, UserSchema


users_schema = UserSchema()


class Register(Resource):
    def get(self):
        users = User.query.all()
        user_list = []
        for i in range(len(users)):
            user_list.append(users[i].serialize())

        return {'status': 'success', 'data': user_list}, 200

    def post(self):
        json_data = request.get_json(force=True)
        if not json_data:
            return {'message': 'No input data provided'}, 400
        # print((json_data))

        data = users_schema.load(json_data)
        # print(errors)
        # if errors:
        #     return errors, 422

        user = User.query.filter_by(username=data['username']).first()

        if user:
            return {'message': 'username not available'}, 400

        api_key = self.generate_key()
        while User.query.filter_by(api_key=api_key).first() != None:
            api_key = self.generate_key()
        user = User(api_key=api_key, username=json_data['username'], password=json_data['password'],
                    first_name=json_data['firstname'], last_name=json_data['lastname'], email=json_data['email'],)

        db.session.add(user)
        db.session.commit()

        # print(json_data)
        return {'data': user.serialize(), 'status': 'success'}

    def generate_key(self):
        return ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(50))
