pip install -r requirements.txt
# python manage.py createsuperuser
# python manage.py makemigrations polls
python manage.py collectstatic --no-input
python manage.py migrate
