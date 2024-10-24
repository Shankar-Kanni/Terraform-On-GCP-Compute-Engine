# Terraform-On-GCP-Compute-Engine

This page describes the steps on how to create a VM on GCP using terraform that runs on the github actions.

Firstly create gcp account and then create a project on the gcp console.

Once the project is created then you can create a service account and generate the api keys and also grant the required IAM role to the service account created.

Add the API json key on the GUTHUB secrets and then use the value in the github workflows.