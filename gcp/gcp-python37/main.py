"""GCP HTTP Cloud Function Python"""
# -*- coding: utf-8 -*-

import json

def hello(request):
    response = {
        "statusCode": 200,
        "body": "hello"
    }

    return json.dumps(response, indent=4)