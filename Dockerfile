FROM python:3.9.1

COPY job.py job.py 

ENTRYPOINT [ "python", "job.py" ]

CMD ${COMMAND}
