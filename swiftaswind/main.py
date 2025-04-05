import openai

def hello():
    return "Hello World"

def call_openai(prompt):
    
    response = openai.Completion.create(model="gpt-3.5-turbo", prompt=prompt)
    return response.choices[0].text

