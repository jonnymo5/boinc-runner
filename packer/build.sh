#!/bin/bash

packer build \
  -var "aws_access_key=${AWS_KEY}" \
  -var "aws_secret_key=${AWS_SECRET}" \
  -var "boinc_url=${WCG_URL}" \
  -var "boinc_key=${WCG_KEY}" \
  $1
