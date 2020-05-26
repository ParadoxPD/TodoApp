from flask_restful import Resource


class User(Resource):
    def __init__(self, user_id, api_key, firstname, lastname, email, password):
        self.user_id = user_id
        self.api_key = api_key
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password

    def get(self):
        return {"message": "Hello, World!"}
