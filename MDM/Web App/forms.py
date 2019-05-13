from wtforms import Form, StringField, SelectField
 
class ASINSearchForm(Form):
    choices = [('ASIN', 'ASIN'),
               ('ASIN Name', 'ASIN Name')]
               
    select = SelectField('Search for music:', choices=choices)
    search = StringField('')