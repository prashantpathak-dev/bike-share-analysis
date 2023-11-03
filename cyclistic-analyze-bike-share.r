{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "57b10945",
   "metadata": {
    "_cell_guid": "c7467331-bf3c-4663-986a-52e3a27db2e7",
    "_uuid": "e66f7001-1bc5-44b0-afe1-0961d0e8aeb2",
    "papermill": {
     "duration": 0.01778,
     "end_time": "2023-11-03T00:14:12.944003",
     "exception": false,
     "start_time": "2023-11-03T00:14:12.926223",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Case Study: How Does a Bike-Share Navigate Speedy Success?"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ad406bd1",
   "metadata": {
    "_cell_guid": "a32afaf7-6437-4931-bea0-d7f2641fda37",
    "_uuid": "417202ef-db0f-4354-b0b6-7d0cbb951c2f",
    "papermill": {
     "duration": 0.014639,
     "end_time": "2023-11-03T00:14:12.973495",
     "exception": false,
     "start_time": "2023-11-03T00:14:12.958856",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Summary**\n",
    "\n",
    "**Cyclistic**: A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.\n",
    "\n",
    "Cyclistic’s pricing plans: single-ride passes, full-day passes,and annual memberships.\n",
    "* Customers who purchase single-ride or full-day passes are referred to as casual riders.\n",
    "* Customers who purchase annual memberships are Cyclistic members.\n",
    "\n",
    "Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders, so maximizing the number of annual members will\n",
    "be key to future growth.\n",
    "\n",
    "### **Goal: Convert casual riders into annual members**"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e87d9979",
   "metadata": {
    "_cell_guid": "2bedb0c6-cb52-43c6-87e6-394ea34adebc",
    "_uuid": "e085e3af-cb9e-4106-80c7-a5b13184d39e",
    "papermill": {
     "duration": 0.015039,
     "end_time": "2023-11-03T00:14:13.004315",
     "exception": false,
     "start_time": "2023-11-03T00:14:12.989276",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Phase 1: Ask**\n",
    "\n",
    "Three questions can guide the future marketing program to fulfill goal:\n",
    "1. How do annual members and casual riders use Cyclistic bikes differently?\n",
    "2. Why would casual riders buy Cyclistic annual memberships?\n",
    "3. How can Cyclistic use digital media to influence casual riders to become members?\n",
    "\n",
    "**1.1 Business Task**\n",
    "\n",
    "How do annual members and casual riders use Cyclistic bikes differently?"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8c355edc",
   "metadata": {
    "_cell_guid": "de494fb5-fa17-4e56-a011-9bd3e73bdb1a",
    "_uuid": "22ff2e67-1086-4719-b94e-2ea3768504e7",
    "papermill": {
     "duration": 0.014203,
     "end_time": "2023-11-03T00:14:13.033237",
     "exception": false,
     "start_time": "2023-11-03T00:14:13.019034",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Phase 2: Prepare**\n",
    "\n",
    "* Cyclistic’s historical trip data: [here](http://divvy-tripdata.s3.amazonaws.com/index.html) \n",
    "* The data has been made available by Motivate International Inc. under this [license](http://www.divvybikes.com/data-license-agreement).\n",
    "* For this analysis, I will be using data for the last 12 months (July 2022 - June 2023).\n",
    "* The data is large (millions of record) and in CSV format. \n",
    "* Credibility of Data : The data is reliable, original, current, comprehensive, cited. (ROCCC)\n",
    "* Limitations of Data: Data-privacy issues prohibit you from using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5ab2129d",
   "metadata": {
    "_cell_guid": "e3436765-28cd-47ec-b314-338bbc67dd64",
    "_uuid": "76748d71-0bf3-43dc-a73d-6f9402fe4698",
    "papermill": {
     "duration": 0.013951,
     "end_time": "2023-11-03T00:14:13.061228",
     "exception": false,
     "start_time": "2023-11-03T00:14:13.047277",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### **Install packages**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "c77675e2",
   "metadata": {
    "_cell_guid": "0a35d354-08ae-4b32-8466-9701282ca4b1",
    "_execution_state": "idle",
    "_kg_hide-output": true,
    "_uuid": "999e9174-5e46-4a0f-a952-b02d2eb416f0",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:14:13.095381Z",
     "iopub.status.busy": "2023-11-03T00:14:13.092879Z",
     "iopub.status.idle": "2023-11-03T00:14:14.265011Z",
     "shell.execute_reply": "2023-11-03T00:14:14.262965Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.191991,
     "end_time": "2023-11-03T00:14:14.267531",
     "exception": false,
     "start_time": "2023-11-03T00:14:13.075540",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.2     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.2     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.2     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.1     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse) #for data import and wrangling\n",
    "library(lubridate) #date functions\n",
    "library(ggplot2) #data visualizations"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e5831f60",
   "metadata": {
    "_cell_guid": "f8b89255-5cb3-48e6-a2a6-113aa9bc85c2",
    "_uuid": "6155f7fe-4fd9-4dc8-8cc4-f0a5de8aaa9f",
    "papermill": {
     "duration": 0.015607,
     "end_time": "2023-11-03T00:14:14.298476",
     "exception": false,
     "start_time": "2023-11-03T00:14:14.282869",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### **Import data**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "05c687a3",
   "metadata": {
    "_cell_guid": "711cf400-8654-460e-9459-ddbb7406b9c2",
    "_kg_hide-output": true,
    "_uuid": "e0218377-33fe-42c7-8b7d-ae72e55b4126",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:14:14.367146Z",
     "iopub.status.busy": "2023-11-03T00:14:14.331738Z",
     "iopub.status.idle": "2023-11-03T00:14:45.568393Z",
     "shell.execute_reply": "2023-11-03T00:14:45.566538Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 31.257278,
     "end_time": "2023-11-03T00:14:45.571263",
     "exception": false,
     "start_time": "2023-11-03T00:14:14.313985",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m823488\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m785932\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m701339\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m558685\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m337735\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m181806\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m190301\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m190445\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m258678\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m426590\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m604827\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m719618\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "july22 <- read_csv(\"../input/cyclistic/202207-tripdata.csv\")\n",
    "aug22 <- read_csv(\"../input/cyclistic/202208-tripdata.csv\")\n",
    "sep22 <- read_csv(\"../input/cyclistic/202209-tripdata.csv\")\n",
    "oct22 <- read_csv(\"../input/cyclistic/202210-tripdata.csv\")\n",
    "nov22 <- read_csv(\"../input/cyclistic/202211-tripdata.csv\")\n",
    "dec22 <- read_csv(\"../input/cyclistic/202212-tripdata.csv\")\n",
    "jan23 <- read_csv(\"../input/cyclistic/202301-tripdata.csv\")\n",
    "feb23 <- read_csv(\"../input/cyclistic/202302-tripdata.csv\")\n",
    "mar23 <- read_csv(\"../input/cyclistic/202303-tripdata.csv\")\n",
    "apr23 <- read_csv(\"../input/cyclistic/202304-tripdata.csv\")\n",
    "may23 <- read_csv(\"../input/cyclistic/202305-tripdata.csv\")\n",
    "june23 <- read_csv(\"../input/cyclistic/202306-tripdata.csv\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b8d97013",
   "metadata": {
    "_cell_guid": "cd3f00a6-238a-434c-b051-a0ce9922c6b7",
    "_uuid": "712dc1be-10fe-4d43-b09e-f76cc41ea895",
    "papermill": {
     "duration": 0.018257,
     "end_time": "2023-11-03T00:14:45.608541",
     "exception": false,
     "start_time": "2023-11-03T00:14:45.590284",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### **Wrangle data and combine into a single file**\n",
    "- Compare column names each of the files\n",
    "- While the names don't have to be in the same order, they DO need to match perfectly before we can use a command to join them into one file"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "f1b89ac1",
   "metadata": {
    "_cell_guid": "55ec97d5-171a-4b72-9f93-3097efdf97e1",
    "_uuid": "f5261d4f-2235-46bc-be9c-446de0deadfc",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:14:45.649936Z",
     "iopub.status.busy": "2023-11-03T00:14:45.647898Z",
     "iopub.status.idle": "2023-11-03T00:14:45.714967Z",
     "shell.execute_reply": "2023-11-03T00:14:45.712714Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.090834,
     "end_time": "2023-11-03T00:14:45.717789",
     "exception": false,
     "start_time": "2023-11-03T00:14:45.626955",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>954144C2F67B1932</td><td>classic_bike </td><td>2022-07-05 08:12:47</td><td>2022-07-05 08:24:32</td><td>Ashland Ave &amp; Blackhawk St </td><td><span style=white-space:pre-wrap>13224       </span></td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St      </span></td><td>KA1503000043</td><td>41.90707</td><td>-87.66725</td><td>41.88918</td><td>-87.63851</td><td>member</td></tr>\n",
       "\t<tr><td>292E027607D218B6</td><td>classic_bike </td><td>2022-07-26 12:53:38</td><td>2022-07-26 12:55:31</td><td>Buckingham Fountain (Temp) </td><td><span style=white-space:pre-wrap>15541       </span></td><td><span style=white-space:pre-wrap>Michigan Ave &amp; 8th St         </span></td><td><span style=white-space:pre-wrap>623         </span></td><td>41.86962</td><td>-87.62398</td><td>41.87277</td><td>-87.62398</td><td>casual</td></tr>\n",
       "\t<tr><td>57765852588AD6E0</td><td>classic_bike </td><td>2022-07-03 13:58:49</td><td>2022-07-03 14:06:32</td><td>Buckingham Fountain (Temp) </td><td><span style=white-space:pre-wrap>15541       </span></td><td><span style=white-space:pre-wrap>Michigan Ave &amp; 8th St         </span></td><td><span style=white-space:pre-wrap>623         </span></td><td>41.86962</td><td>-87.62398</td><td>41.87277</td><td>-87.62398</td><td>casual</td></tr>\n",
       "\t<tr><td>B5B6BE44314590E6</td><td>classic_bike </td><td>2022-07-31 17:44:21</td><td>2022-07-31 18:42:50</td><td>Buckingham Fountain (Temp) </td><td><span style=white-space:pre-wrap>15541       </span></td><td><span style=white-space:pre-wrap>Woodlawn Ave &amp; 55th St        </span></td><td>TA1307000164</td><td>41.86962</td><td>-87.62398</td><td>41.79526</td><td>-87.59647</td><td>casual</td></tr>\n",
       "\t<tr><td>A4C331F2A00E79E0</td><td>classic_bike </td><td>2022-07-13 19:49:06</td><td>2022-07-13 20:15:24</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave     </span></td><td>TA1307000117</td><td>Sheffield Ave &amp; Wellington Ave</td><td>TA1307000052</td><td>41.89147</td><td>-87.62676</td><td>41.93625</td><td>-87.65266</td><td>member</td></tr>\n",
       "\t<tr><td>579D73BE2ED880B3</td><td>electric_bike</td><td>2022-07-01 17:04:35</td><td>2022-07-01 17:13:18</td><td>Desplaines St &amp; Randolph St</td><td><span style=white-space:pre-wrap>15535       </span></td><td><span style=white-space:pre-wrap>Clinton St &amp; Roosevelt Rd     </span></td><td><span style=white-space:pre-wrap>WL-008      </span></td><td>41.88461</td><td>-87.64456</td><td>41.86712</td><td>-87.64109</td><td>member</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 13\n",
       "\\begin{tabular}{lllllllllllll}\n",
       " ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual\\\\\n",
       " <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t 954144C2F67B1932 & classic\\_bike  & 2022-07-05 08:12:47 & 2022-07-05 08:24:32 & Ashland Ave \\& Blackhawk St  & 13224        & Kingsbury St \\& Kinzie St       & KA1503000043 & 41.90707 & -87.66725 & 41.88918 & -87.63851 & member\\\\\n",
       "\t 292E027607D218B6 & classic\\_bike  & 2022-07-26 12:53:38 & 2022-07-26 12:55:31 & Buckingham Fountain (Temp)  & 15541        & Michigan Ave \\& 8th St          & 623          & 41.86962 & -87.62398 & 41.87277 & -87.62398 & casual\\\\\n",
       "\t 57765852588AD6E0 & classic\\_bike  & 2022-07-03 13:58:49 & 2022-07-03 14:06:32 & Buckingham Fountain (Temp)  & 15541        & Michigan Ave \\& 8th St          & 623          & 41.86962 & -87.62398 & 41.87277 & -87.62398 & casual\\\\\n",
       "\t B5B6BE44314590E6 & classic\\_bike  & 2022-07-31 17:44:21 & 2022-07-31 18:42:50 & Buckingham Fountain (Temp)  & 15541        & Woodlawn Ave \\& 55th St         & TA1307000164 & 41.86962 & -87.62398 & 41.79526 & -87.59647 & casual\\\\\n",
       "\t A4C331F2A00E79E0 & classic\\_bike  & 2022-07-13 19:49:06 & 2022-07-13 20:15:24 & Wabash Ave \\& Grand Ave      & TA1307000117 & Sheffield Ave \\& Wellington Ave & TA1307000052 & 41.89147 & -87.62676 & 41.93625 & -87.65266 & member\\\\\n",
       "\t 579D73BE2ED880B3 & electric\\_bike & 2022-07-01 17:04:35 & 2022-07-01 17:13:18 & Desplaines St \\& Randolph St & 15535        & Clinton St \\& Roosevelt Rd      & WL-008       & 41.88461 & -87.64456 & 41.86712 & -87.64109 & member\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 13\n",
       "\n",
       "| ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 954144C2F67B1932 | classic_bike  | 2022-07-05 08:12:47 | 2022-07-05 08:24:32 | Ashland Ave &amp; Blackhawk St  | 13224        | Kingsbury St &amp; Kinzie St       | KA1503000043 | 41.90707 | -87.66725 | 41.88918 | -87.63851 | member |\n",
       "| 292E027607D218B6 | classic_bike  | 2022-07-26 12:53:38 | 2022-07-26 12:55:31 | Buckingham Fountain (Temp)  | 15541        | Michigan Ave &amp; 8th St          | 623          | 41.86962 | -87.62398 | 41.87277 | -87.62398 | casual |\n",
       "| 57765852588AD6E0 | classic_bike  | 2022-07-03 13:58:49 | 2022-07-03 14:06:32 | Buckingham Fountain (Temp)  | 15541        | Michigan Ave &amp; 8th St          | 623          | 41.86962 | -87.62398 | 41.87277 | -87.62398 | casual |\n",
       "| B5B6BE44314590E6 | classic_bike  | 2022-07-31 17:44:21 | 2022-07-31 18:42:50 | Buckingham Fountain (Temp)  | 15541        | Woodlawn Ave &amp; 55th St         | TA1307000164 | 41.86962 | -87.62398 | 41.79526 | -87.59647 | casual |\n",
       "| A4C331F2A00E79E0 | classic_bike  | 2022-07-13 19:49:06 | 2022-07-13 20:15:24 | Wabash Ave &amp; Grand Ave      | TA1307000117 | Sheffield Ave &amp; Wellington Ave | TA1307000052 | 41.89147 | -87.62676 | 41.93625 | -87.65266 | member |\n",
       "| 579D73BE2ED880B3 | electric_bike | 2022-07-01 17:04:35 | 2022-07-01 17:13:18 | Desplaines St &amp; Randolph St | 15535        | Clinton St &amp; Roosevelt Rd      | WL-008       | 41.88461 | -87.64456 | 41.86712 | -87.64109 | member |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 954144C2F67B1932 classic_bike  2022-07-05 08:12:47 2022-07-05 08:24:32\n",
       "2 292E027607D218B6 classic_bike  2022-07-26 12:53:38 2022-07-26 12:55:31\n",
       "3 57765852588AD6E0 classic_bike  2022-07-03 13:58:49 2022-07-03 14:06:32\n",
       "4 B5B6BE44314590E6 classic_bike  2022-07-31 17:44:21 2022-07-31 18:42:50\n",
       "5 A4C331F2A00E79E0 classic_bike  2022-07-13 19:49:06 2022-07-13 20:15:24\n",
       "6 579D73BE2ED880B3 electric_bike 2022-07-01 17:04:35 2022-07-01 17:13:18\n",
       "  start_station_name          start_station_id end_station_name              \n",
       "1 Ashland Ave & Blackhawk St  13224            Kingsbury St & Kinzie St      \n",
       "2 Buckingham Fountain (Temp)  15541            Michigan Ave & 8th St         \n",
       "3 Buckingham Fountain (Temp)  15541            Michigan Ave & 8th St         \n",
       "4 Buckingham Fountain (Temp)  15541            Woodlawn Ave & 55th St        \n",
       "5 Wabash Ave & Grand Ave      TA1307000117     Sheffield Ave & Wellington Ave\n",
       "6 Desplaines St & Randolph St 15535            Clinton St & Roosevelt Rd     \n",
       "  end_station_id start_lat start_lng end_lat  end_lng   member_casual\n",
       "1 KA1503000043   41.90707  -87.66725 41.88918 -87.63851 member       \n",
       "2 623            41.86962  -87.62398 41.87277 -87.62398 casual       \n",
       "3 623            41.86962  -87.62398 41.87277 -87.62398 casual       \n",
       "4 TA1307000164   41.86962  -87.62398 41.79526 -87.59647 casual       \n",
       "5 TA1307000052   41.89147  -87.62676 41.93625 -87.65266 member       \n",
       "6 WL-008         41.88461  -87.64456 41.86712 -87.64109 member       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Inspect the dataframes and look for incongruencies\n",
    "head(july22)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "593e8388",
   "metadata": {
    "_cell_guid": "c3488edc-f4e5-4175-920c-d2f0d708ab73",
    "_uuid": "10d160fe-240a-4b06-b793-98eb8b228bd0",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:14:45.760230Z",
     "iopub.status.busy": "2023-11-03T00:14:45.758084Z",
     "iopub.status.idle": "2023-11-03T00:14:52.729158Z",
     "shell.execute_reply": "2023-11-03T00:14:52.727143Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 6.996088,
     "end_time": "2023-11-03T00:14:52.732534",
     "exception": false,
     "start_time": "2023-11-03T00:14:45.736446",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Merging datasets using bind_rows()\n",
    "trips <- bind_rows(july22,aug22,sep22,oct22,nov22,dec22,jan23,feb23,mar23,apr23,may23,june23)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "5d20ecf4",
   "metadata": {
    "_cell_guid": "4b3f44fd-ac1b-4b12-a340-928ac4d50f3c",
    "_uuid": "7481c061-e455-470f-9141-01a0b3ba6e21",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:14:52.774304Z",
     "iopub.status.busy": "2023-11-03T00:14:52.772602Z",
     "iopub.status.idle": "2023-11-03T00:14:58.201452Z",
     "shell.execute_reply": "2023-11-03T00:14:58.199524Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 5.452487,
     "end_time": "2023-11-03T00:14:58.204141",
     "exception": false,
     "start_time": "2023-11-03T00:14:52.751654",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "3558893"
      ],
      "text/latex": [
       "3558893"
      ],
      "text/markdown": [
       "3558893"
      ],
      "text/plain": [
       "[1] 3558893"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Total Null Values\n",
    "sum(is.na(trips))\n",
    "\n",
    "# Remove rows with Null value\n",
    "trips <- drop_na(trips)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7641bab5",
   "metadata": {
    "_cell_guid": "d7b15fdb-c9da-4d14-a4ba-dd2f952b3cef",
    "_uuid": "e4bcf9a9-83a3-44ca-97a0-26ce1cceb81d",
    "papermill": {
     "duration": 0.019071,
     "end_time": "2023-11-03T00:14:58.242988",
     "exception": false,
     "start_time": "2023-11-03T00:14:58.223917",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Phase 3: Process**\n",
    "Inspect the **trips** dataset that has been created using head(), nrow(), colnames(), dim(), str(), glimpse(), colnames(), summary()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "314276bc",
   "metadata": {
    "_cell_guid": "5a67955a-8bcb-4470-8ff4-a6dd3a39d450",
    "_uuid": "5a79cdc1-90b2-4db0-b892-87f308cd914e",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:14:58.285506Z",
     "iopub.status.busy": "2023-11-03T00:14:58.283895Z",
     "iopub.status.idle": "2023-11-03T00:14:58.329298Z",
     "shell.execute_reply": "2023-11-03T00:14:58.327491Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.068997,
     "end_time": "2023-11-03T00:14:58.331912",
     "exception": false,
     "start_time": "2023-11-03T00:14:58.262915",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>954144C2F67B1932</td><td>classic_bike </td><td>2022-07-05 08:12:47</td><td>2022-07-05 08:24:32</td><td>Ashland Ave &amp; Blackhawk St </td><td><span style=white-space:pre-wrap>13224       </span></td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St      </span></td><td>KA1503000043</td><td>41.90707</td><td>-87.66725</td><td>41.88918</td><td>-87.63851</td><td>member</td></tr>\n",
       "\t<tr><td>292E027607D218B6</td><td>classic_bike </td><td>2022-07-26 12:53:38</td><td>2022-07-26 12:55:31</td><td>Buckingham Fountain (Temp) </td><td><span style=white-space:pre-wrap>15541       </span></td><td><span style=white-space:pre-wrap>Michigan Ave &amp; 8th St         </span></td><td><span style=white-space:pre-wrap>623         </span></td><td>41.86962</td><td>-87.62398</td><td>41.87277</td><td>-87.62398</td><td>casual</td></tr>\n",
       "\t<tr><td>57765852588AD6E0</td><td>classic_bike </td><td>2022-07-03 13:58:49</td><td>2022-07-03 14:06:32</td><td>Buckingham Fountain (Temp) </td><td><span style=white-space:pre-wrap>15541       </span></td><td><span style=white-space:pre-wrap>Michigan Ave &amp; 8th St         </span></td><td><span style=white-space:pre-wrap>623         </span></td><td>41.86962</td><td>-87.62398</td><td>41.87277</td><td>-87.62398</td><td>casual</td></tr>\n",
       "\t<tr><td>B5B6BE44314590E6</td><td>classic_bike </td><td>2022-07-31 17:44:21</td><td>2022-07-31 18:42:50</td><td>Buckingham Fountain (Temp) </td><td><span style=white-space:pre-wrap>15541       </span></td><td><span style=white-space:pre-wrap>Woodlawn Ave &amp; 55th St        </span></td><td>TA1307000164</td><td>41.86962</td><td>-87.62398</td><td>41.79526</td><td>-87.59647</td><td>casual</td></tr>\n",
       "\t<tr><td>A4C331F2A00E79E0</td><td>classic_bike </td><td>2022-07-13 19:49:06</td><td>2022-07-13 20:15:24</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave     </span></td><td>TA1307000117</td><td>Sheffield Ave &amp; Wellington Ave</td><td>TA1307000052</td><td>41.89147</td><td>-87.62676</td><td>41.93625</td><td>-87.65266</td><td>member</td></tr>\n",
       "\t<tr><td>579D73BE2ED880B3</td><td>electric_bike</td><td>2022-07-01 17:04:35</td><td>2022-07-01 17:13:18</td><td>Desplaines St &amp; Randolph St</td><td><span style=white-space:pre-wrap>15535       </span></td><td><span style=white-space:pre-wrap>Clinton St &amp; Roosevelt Rd     </span></td><td><span style=white-space:pre-wrap>WL-008      </span></td><td>41.88461</td><td>-87.64456</td><td>41.86712</td><td>-87.64109</td><td>member</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 13\n",
       "\\begin{tabular}{lllllllllllll}\n",
       " ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual\\\\\n",
       " <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t 954144C2F67B1932 & classic\\_bike  & 2022-07-05 08:12:47 & 2022-07-05 08:24:32 & Ashland Ave \\& Blackhawk St  & 13224        & Kingsbury St \\& Kinzie St       & KA1503000043 & 41.90707 & -87.66725 & 41.88918 & -87.63851 & member\\\\\n",
       "\t 292E027607D218B6 & classic\\_bike  & 2022-07-26 12:53:38 & 2022-07-26 12:55:31 & Buckingham Fountain (Temp)  & 15541        & Michigan Ave \\& 8th St          & 623          & 41.86962 & -87.62398 & 41.87277 & -87.62398 & casual\\\\\n",
       "\t 57765852588AD6E0 & classic\\_bike  & 2022-07-03 13:58:49 & 2022-07-03 14:06:32 & Buckingham Fountain (Temp)  & 15541        & Michigan Ave \\& 8th St          & 623          & 41.86962 & -87.62398 & 41.87277 & -87.62398 & casual\\\\\n",
       "\t B5B6BE44314590E6 & classic\\_bike  & 2022-07-31 17:44:21 & 2022-07-31 18:42:50 & Buckingham Fountain (Temp)  & 15541        & Woodlawn Ave \\& 55th St         & TA1307000164 & 41.86962 & -87.62398 & 41.79526 & -87.59647 & casual\\\\\n",
       "\t A4C331F2A00E79E0 & classic\\_bike  & 2022-07-13 19:49:06 & 2022-07-13 20:15:24 & Wabash Ave \\& Grand Ave      & TA1307000117 & Sheffield Ave \\& Wellington Ave & TA1307000052 & 41.89147 & -87.62676 & 41.93625 & -87.65266 & member\\\\\n",
       "\t 579D73BE2ED880B3 & electric\\_bike & 2022-07-01 17:04:35 & 2022-07-01 17:13:18 & Desplaines St \\& Randolph St & 15535        & Clinton St \\& Roosevelt Rd      & WL-008       & 41.88461 & -87.64456 & 41.86712 & -87.64109 & member\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 13\n",
       "\n",
       "| ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 954144C2F67B1932 | classic_bike  | 2022-07-05 08:12:47 | 2022-07-05 08:24:32 | Ashland Ave &amp; Blackhawk St  | 13224        | Kingsbury St &amp; Kinzie St       | KA1503000043 | 41.90707 | -87.66725 | 41.88918 | -87.63851 | member |\n",
       "| 292E027607D218B6 | classic_bike  | 2022-07-26 12:53:38 | 2022-07-26 12:55:31 | Buckingham Fountain (Temp)  | 15541        | Michigan Ave &amp; 8th St          | 623          | 41.86962 | -87.62398 | 41.87277 | -87.62398 | casual |\n",
       "| 57765852588AD6E0 | classic_bike  | 2022-07-03 13:58:49 | 2022-07-03 14:06:32 | Buckingham Fountain (Temp)  | 15541        | Michigan Ave &amp; 8th St          | 623          | 41.86962 | -87.62398 | 41.87277 | -87.62398 | casual |\n",
       "| B5B6BE44314590E6 | classic_bike  | 2022-07-31 17:44:21 | 2022-07-31 18:42:50 | Buckingham Fountain (Temp)  | 15541        | Woodlawn Ave &amp; 55th St         | TA1307000164 | 41.86962 | -87.62398 | 41.79526 | -87.59647 | casual |\n",
       "| A4C331F2A00E79E0 | classic_bike  | 2022-07-13 19:49:06 | 2022-07-13 20:15:24 | Wabash Ave &amp; Grand Ave      | TA1307000117 | Sheffield Ave &amp; Wellington Ave | TA1307000052 | 41.89147 | -87.62676 | 41.93625 | -87.65266 | member |\n",
       "| 579D73BE2ED880B3 | electric_bike | 2022-07-01 17:04:35 | 2022-07-01 17:13:18 | Desplaines St &amp; Randolph St | 15535        | Clinton St &amp; Roosevelt Rd      | WL-008       | 41.88461 | -87.64456 | 41.86712 | -87.64109 | member |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 954144C2F67B1932 classic_bike  2022-07-05 08:12:47 2022-07-05 08:24:32\n",
       "2 292E027607D218B6 classic_bike  2022-07-26 12:53:38 2022-07-26 12:55:31\n",
       "3 57765852588AD6E0 classic_bike  2022-07-03 13:58:49 2022-07-03 14:06:32\n",
       "4 B5B6BE44314590E6 classic_bike  2022-07-31 17:44:21 2022-07-31 18:42:50\n",
       "5 A4C331F2A00E79E0 classic_bike  2022-07-13 19:49:06 2022-07-13 20:15:24\n",
       "6 579D73BE2ED880B3 electric_bike 2022-07-01 17:04:35 2022-07-01 17:13:18\n",
       "  start_station_name          start_station_id end_station_name              \n",
       "1 Ashland Ave & Blackhawk St  13224            Kingsbury St & Kinzie St      \n",
       "2 Buckingham Fountain (Temp)  15541            Michigan Ave & 8th St         \n",
       "3 Buckingham Fountain (Temp)  15541            Michigan Ave & 8th St         \n",
       "4 Buckingham Fountain (Temp)  15541            Woodlawn Ave & 55th St        \n",
       "5 Wabash Ave & Grand Ave      TA1307000117     Sheffield Ave & Wellington Ave\n",
       "6 Desplaines St & Randolph St 15535            Clinton St & Roosevelt Rd     \n",
       "  end_station_id start_lat start_lng end_lat  end_lng   member_casual\n",
       "1 KA1503000043   41.90707  -87.66725 41.88918 -87.63851 member       \n",
       "2 623            41.86962  -87.62398 41.87277 -87.62398 casual       \n",
       "3 623            41.86962  -87.62398 41.87277 -87.62398 casual       \n",
       "4 TA1307000164   41.86962  -87.62398 41.79526 -87.59647 casual       \n",
       "5 TA1307000052   41.89147  -87.62676 41.93625 -87.65266 member       \n",
       "6 WL-008         41.88461  -87.64456 41.86712 -87.64109 member       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#view the first 6 rows of the data frame\n",
    "\n",
    "head(trips) \n",
    "\n",
    "#tail(trips) - see the last 6 rows of the data frame"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "5adf74a7",
   "metadata": {
    "_cell_guid": "0dcf42bf-b1ad-403a-8537-c918d24830c1",
    "_uuid": "23d55b2e-a758-4063-b6bf-a22864d25dba",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:14:58.375321Z",
     "iopub.status.busy": "2023-11-03T00:14:58.373667Z",
     "iopub.status.idle": "2023-11-03T00:14:58.390903Z",
     "shell.execute_reply": "2023-11-03T00:14:58.389177Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.041466,
     "end_time": "2023-11-03T00:14:58.393388",
     "exception": false,
     "start_time": "2023-11-03T00:14:58.351922",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "4409089"
      ],
      "text/latex": [
       "4409089"
      ],
      "text/markdown": [
       "4409089"
      ],
      "text/plain": [
       "[1] 4409089"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "nrow(trips) #how many rows are in the data frame"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "4e6cd425",
   "metadata": {
    "_cell_guid": "9637d097-565e-4919-bbc1-c37f011aaa2d",
    "_uuid": "c85aca8c-e727-47e0-bbb6-516ef9f0095f",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:14:58.437324Z",
     "iopub.status.busy": "2023-11-03T00:14:58.435643Z",
     "iopub.status.idle": "2023-11-03T00:14:58.454123Z",
     "shell.execute_reply": "2023-11-03T00:14:58.452236Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.042934,
     "end_time": "2023-11-03T00:14:58.456715",
     "exception": false,
     "start_time": "2023-11-03T00:14:58.413781",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(trips) #list of column names"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "45ba4f74",
   "metadata": {
    "_cell_guid": "babbdf46-2c8c-47b3-bd34-42dee94faffa",
    "_uuid": "88b934c0-fc77-4f0b-b403-af3ae97b19d5",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:14:58.500389Z",
     "iopub.status.busy": "2023-11-03T00:14:58.498748Z",
     "iopub.status.idle": "2023-11-03T00:14:58.516339Z",
     "shell.execute_reply": "2023-11-03T00:14:58.514556Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.042111,
     "end_time": "2023-11-03T00:14:58.518784",
     "exception": false,
     "start_time": "2023-11-03T00:14:58.476673",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>4409089</li><li>13</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 4409089\n",
       "\\item 13\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 4409089\n",
       "2. 13\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 4409089      13"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "dim(trips) #dimensions of the data frame"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "322ec37f",
   "metadata": {
    "_cell_guid": "c12350de-78dd-4153-9af3-ba80f3b1a44f",
    "_kg_hide-output": true,
    "_uuid": "7d656076-0826-4499-adbe-237c2a5f310f",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:14:58.565576Z",
     "iopub.status.busy": "2023-11-03T00:14:58.563920Z",
     "iopub.status.idle": "2023-11-03T00:14:58.611534Z",
     "shell.execute_reply": "2023-11-03T00:14:58.609301Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.072761,
     "end_time": "2023-11-03T00:14:58.614137",
     "exception": false,
     "start_time": "2023-11-03T00:14:58.541376",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "tibble [4,409,089 × 13] (S3: tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:4409089] \"954144C2F67B1932\" \"292E027607D218B6\" \"57765852588AD6E0\" \"B5B6BE44314590E6\" ...\n",
      " $ rideable_type     : chr [1:4409089] \"classic_bike\" \"classic_bike\" \"classic_bike\" \"classic_bike\" ...\n",
      " $ started_at        : POSIXct[1:4409089], format: \"2022-07-05 08:12:47\" \"2022-07-26 12:53:38\" ...\n",
      " $ ended_at          : POSIXct[1:4409089], format: \"2022-07-05 08:24:32\" \"2022-07-26 12:55:31\" ...\n",
      " $ start_station_name: chr [1:4409089] \"Ashland Ave & Blackhawk St\" \"Buckingham Fountain (Temp)\" \"Buckingham Fountain (Temp)\" \"Buckingham Fountain (Temp)\" ...\n",
      " $ start_station_id  : chr [1:4409089] \"13224\" \"15541\" \"15541\" \"15541\" ...\n",
      " $ end_station_name  : chr [1:4409089] \"Kingsbury St & Kinzie St\" \"Michigan Ave & 8th St\" \"Michigan Ave & 8th St\" \"Woodlawn Ave & 55th St\" ...\n",
      " $ end_station_id    : chr [1:4409089] \"KA1503000043\" \"623\" \"623\" \"TA1307000164\" ...\n",
      " $ start_lat         : num [1:4409089] 41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num [1:4409089] -87.7 -87.6 -87.6 -87.6 -87.6 ...\n",
      " $ end_lat           : num [1:4409089] 41.9 41.9 41.9 41.8 41.9 ...\n",
      " $ end_lng           : num [1:4409089] -87.6 -87.6 -87.6 -87.6 -87.7 ...\n",
      " $ member_casual     : chr [1:4409089] \"member\" \"casual\" \"casual\" \"casual\" ...\n"
     ]
    }
   ],
   "source": [
    "str(trips) #see list of columns and data types"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "ee3d9f16",
   "metadata": {
    "_cell_guid": "1bc1d316-c510-4625-95d3-1cde1ca2d8a6",
    "_kg_hide-output": true,
    "_uuid": "46faea18-eea6-46e0-8cff-056a07436c2d",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:14:58.658778Z",
     "iopub.status.busy": "2023-11-03T00:14:58.657099Z",
     "iopub.status.idle": "2023-11-03T00:15:00.855568Z",
     "shell.execute_reply": "2023-11-03T00:15:00.853283Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 2.223804,
     "end_time": "2023-11-03T00:15:00.858618",
     "exception": false,
     "start_time": "2023-11-03T00:14:58.634814",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type        started_at                 \n",
       " Length:4409089     Length:4409089     Min.   :2022-07-01 00:00:01  \n",
       " Class :character   Class :character   1st Qu.:2022-08-24 14:46:20  \n",
       " Mode  :character   Mode  :character   Median :2022-11-01 15:50:55  \n",
       "                                       Mean   :2022-12-12 14:37:50  \n",
       "                                       3rd Qu.:2023-04-20 11:49:22  \n",
       "                                       Max.   :2023-06-30 23:59:45  \n",
       "    ended_at                   start_station_name start_station_id  \n",
       " Min.   :2022-07-01 00:06:23   Length:4409089     Length:4409089    \n",
       " 1st Qu.:2022-08-24 15:03:24   Class :character   Class :character  \n",
       " Median :2022-11-01 16:05:21   Mode  :character   Mode  :character  \n",
       " Mean   :2022-12-12 14:53:53                                        \n",
       " 3rd Qu.:2023-04-20 12:01:18                                        \n",
       " Max.   :2023-07-01 18:26:01                                        \n",
       " end_station_name   end_station_id       start_lat       start_lng     \n",
       " Length:4409089     Length:4409089     Min.   :41.65   Min.   :-87.84  \n",
       " Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Mode  :character   Mode  :character   Median :41.90   Median :-87.64  \n",
       "                                       Mean   :41.90   Mean   :-87.65  \n",
       "                                       3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       "                                       Max.   :42.06   Max.   :-87.53  \n",
       "    end_lat         end_lng       member_casual     \n",
       " Min.   : 0.00   Min.   :-87.84   Length:4409089    \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   Class :character  \n",
       " Median :41.90   Median :-87.64   Mode  :character  \n",
       " Mean   :41.90   Mean   :-87.65                     \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63                     \n",
       " Max.   :42.06   Max.   :  0.00                     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(trips) #statistical summary of data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "8dbf1695",
   "metadata": {
    "_cell_guid": "74e4dded-b10b-4a10-a382-feb19b032d03",
    "_uuid": "e733cb3f-eec7-4c43-9be8-22d99db0ccb4",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:00.902970Z",
     "iopub.status.busy": "2023-11-03T00:15:00.901071Z",
     "iopub.status.idle": "2023-11-03T00:15:01.466471Z",
     "shell.execute_reply": "2023-11-03T00:15:01.463989Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.590891,
     "end_time": "2023-11-03T00:15:01.469677",
     "exception": false,
     "start_time": "2023-11-03T00:15:00.878786",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>member</td><td>2733456</td></tr>\n",
       "\t<tr><td>casual</td><td>1675633</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t member & 2733456\\\\\n",
       "\t casual & 1675633\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| member | 2733456 |\n",
       "| casual | 1675633 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual n      \n",
       "1 member        2733456\n",
       "2 casual        1675633"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Validate member column responses (only contains member and casual)\n",
    "trips %>% count(member_casual, sort=TRUE)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "1e33c2b1",
   "metadata": {
    "_cell_guid": "3f1eb7c1-a8ad-4e04-a870-4d46afcf8a5a",
    "_uuid": "95921f0d-f59d-435d-b0d4-f51d0a8e4314",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:01.515873Z",
     "iopub.status.busy": "2023-11-03T00:15:01.514246Z",
     "iopub.status.idle": "2023-11-03T00:15:01.637860Z",
     "shell.execute_reply": "2023-11-03T00:15:01.635472Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.149327,
     "end_time": "2023-11-03T00:15:01.640746",
     "exception": false,
     "start_time": "2023-11-03T00:15:01.491419",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 3 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>rideable_type</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>classic_bike </td><td>2491986</td></tr>\n",
       "\t<tr><td>electric_bike</td><td>1778245</td></tr>\n",
       "\t<tr><td>docked_bike  </td><td> 138858</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 3 × 2\n",
       "\\begin{tabular}{ll}\n",
       " rideable\\_type & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t classic\\_bike  & 2491986\\\\\n",
       "\t electric\\_bike & 1778245\\\\\n",
       "\t docked\\_bike   &  138858\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 3 × 2\n",
       "\n",
       "| rideable_type &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| classic_bike  | 2491986 |\n",
       "| electric_bike | 1778245 |\n",
       "| docked_bike   |  138858 |\n",
       "\n"
      ],
      "text/plain": [
       "  rideable_type n      \n",
       "1 classic_bike  2491986\n",
       "2 electric_bike 1778245\n",
       "3 docked_bike    138858"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Validate responses for rideable types\n",
    "trips %>% count(rideable_type, sort=TRUE)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ccd2ee7d",
   "metadata": {
    "_cell_guid": "473d4eef-db36-4a9d-bb6c-ed8307bf3e93",
    "_uuid": "a2016f2c-14ed-4c2b-b498-92570c35faea",
    "papermill": {
     "duration": 0.020779,
     "end_time": "2023-11-03T00:15:01.683030",
     "exception": false,
     "start_time": "2023-11-03T00:15:01.662251",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "- Identifying trends will be easier by adding columns like year, month, day, time, and day of the week.\n",
    "- Adding a column for trip duration. We will need to verify it to make sure it does not negative values. (no trips are negative)."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "15c9efbc",
   "metadata": {
    "_cell_guid": "d6bc0dee-0cf6-419a-a0dc-14dc0d535524",
    "_kg_hide-output": true,
    "_uuid": "74379463-c284-4c0d-8975-3df4bdf49417",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:01.727266Z",
     "iopub.status.busy": "2023-11-03T00:15:01.725393Z",
     "iopub.status.idle": "2023-11-03T00:15:11.013722Z",
     "shell.execute_reply": "2023-11-03T00:15:11.012000Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 9.313022,
     "end_time": "2023-11-03T00:15:11.016027",
     "exception": false,
     "start_time": "2023-11-03T00:15:01.703005",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li><li>'date'</li><li>'month'</li><li>'day'</li><li>'year'</li><li>'day_of_week'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'date'\n",
       "\\item 'month'\n",
       "\\item 'day'\n",
       "\\item 'year'\n",
       "\\item 'day\\_of\\_week'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "14. 'date'\n",
       "15. 'month'\n",
       "16. 'day'\n",
       "17. 'year'\n",
       "18. 'day_of_week'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"      \"date\"               \"month\"             \n",
       "[16] \"day\"                \"year\"               \"day_of_week\"       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Adding columns for date, month, year, day of the week into the data frame, reference: https://www.statmethods.net/input/dates.html\n",
    "trips$date <- as.Date(trips$started_at) \n",
    "trips$month <- format(as.Date(trips$date), \"%b\")\n",
    "trips$day <- format(as.Date(trips$date), \"%d\")\n",
    "trips$year <- format(as.Date(trips$date), \"%Y\")\n",
    "trips$day_of_week <- format(as.Date(trips$date), \"%A\")\n",
    "colnames(trips) #to get the names of all the columns"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "8377dc31",
   "metadata": {
    "_cell_guid": "9e4a8b8f-c6b6-454c-9a61-d258daf5b425",
    "_kg_hide-output": true,
    "_uuid": "544e10b5-0207-4272-a3d0-8b47c12ade5c",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:11.060771Z",
     "iopub.status.busy": "2023-11-03T00:15:11.059146Z",
     "iopub.status.idle": "2023-11-03T00:15:11.145790Z",
     "shell.execute_reply": "2023-11-03T00:15:11.143631Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.111676,
     "end_time": "2023-11-03T00:15:11.148142",
     "exception": false,
     "start_time": "2023-11-03T00:15:11.036466",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "tibble [4,409,089 × 19] (S3: tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:4409089] \"954144C2F67B1932\" \"292E027607D218B6\" \"57765852588AD6E0\" \"B5B6BE44314590E6\" ...\n",
      " $ rideable_type     : chr [1:4409089] \"classic_bike\" \"classic_bike\" \"classic_bike\" \"classic_bike\" ...\n",
      " $ started_at        : POSIXct[1:4409089], format: \"2022-07-05 08:12:47\" \"2022-07-26 12:53:38\" ...\n",
      " $ ended_at          : POSIXct[1:4409089], format: \"2022-07-05 08:24:32\" \"2022-07-26 12:55:31\" ...\n",
      " $ start_station_name: chr [1:4409089] \"Ashland Ave & Blackhawk St\" \"Buckingham Fountain (Temp)\" \"Buckingham Fountain (Temp)\" \"Buckingham Fountain (Temp)\" ...\n",
      " $ start_station_id  : chr [1:4409089] \"13224\" \"15541\" \"15541\" \"15541\" ...\n",
      " $ end_station_name  : chr [1:4409089] \"Kingsbury St & Kinzie St\" \"Michigan Ave & 8th St\" \"Michigan Ave & 8th St\" \"Woodlawn Ave & 55th St\" ...\n",
      " $ end_station_id    : chr [1:4409089] \"KA1503000043\" \"623\" \"623\" \"TA1307000164\" ...\n",
      " $ start_lat         : num [1:4409089] 41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num [1:4409089] -87.7 -87.6 -87.6 -87.6 -87.6 ...\n",
      " $ end_lat           : num [1:4409089] 41.9 41.9 41.9 41.8 41.9 ...\n",
      " $ end_lng           : num [1:4409089] -87.6 -87.6 -87.6 -87.6 -87.7 ...\n",
      " $ member_casual     : chr [1:4409089] \"member\" \"casual\" \"casual\" \"casual\" ...\n",
      " $ date              : Date[1:4409089], format: \"2022-07-05\" \"2022-07-26\" ...\n",
      " $ month             : chr [1:4409089] \"Jul\" \"Jul\" \"Jul\" \"Jul\" ...\n",
      " $ day               : chr [1:4409089] \"05\" \"26\" \"03\" \"31\" ...\n",
      " $ year              : chr [1:4409089] \"2022\" \"2022\" \"2022\" \"2022\" ...\n",
      " $ day_of_week       : chr [1:4409089] \"Tuesday\" \"Tuesday\" \"Sunday\" \"Sunday\" ...\n",
      " $ ride_length       : 'difftime' num [1:4409089] 705 113 463 3509 ...\n",
      "  ..- attr(*, \"units\")= chr \"secs\"\n"
     ]
    }
   ],
   "source": [
    "#Add a ride_length calculation to trips\n",
    "\n",
    "#he difftime() function in R computes the difference between two objects of date or time.\n",
    "\n",
    "trips$ride_length <- difftime(trips$ended_at, trips$started_at) \n",
    "\n",
    "#Inspect the structure of the columns\n",
    "str(trips)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "5673d25f",
   "metadata": {
    "_cell_guid": "660dea53-88b0-4b61-a368-7feab2e19163",
    "_kg_hide-output": true,
    "_uuid": "053c288c-1740-48f6-adb4-a48b243b4f44",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:11.231576Z",
     "iopub.status.busy": "2023-11-03T00:15:11.229985Z",
     "iopub.status.idle": "2023-11-03T00:15:17.094569Z",
     "shell.execute_reply": "2023-11-03T00:15:17.092809Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 5.928464,
     "end_time": "2023-11-03T00:15:17.097339",
     "exception": false,
     "start_time": "2023-11-03T00:15:11.168875",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "TRUE"
      ],
      "text/latex": [
       "TRUE"
      ],
      "text/markdown": [
       "TRUE"
      ],
      "text/plain": [
       "[1] TRUE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Convert ride_length from Factor to Numeric in order to run calculations\n",
    "trips$ride_length <- as.numeric(as.character(trips$ride_length))\n",
    "is.numeric(trips$ride_length) #to confirm it is now numeric"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "f245c7e8",
   "metadata": {
    "_cell_guid": "23e0543b-6ede-4c84-a308-d9b173a4e728",
    "_uuid": "e99fb490-06c1-4873-980c-d265dca8a55f",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:17.143284Z",
     "iopub.status.busy": "2023-11-03T00:15:17.141577Z",
     "iopub.status.idle": "2023-11-03T00:15:17.424597Z",
     "shell.execute_reply": "2023-11-03T00:15:17.422785Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.30877,
     "end_time": "2023-11-03T00:15:17.427175",
     "exception": false,
     "start_time": "2023-11-03T00:15:17.118405",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. \n",
       " -10122.0     343.0     600.0     963.1    1071.0 1922127.0 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#check summary of ride_length data\n",
    "summary(trips$ride_length)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "89eb3f09",
   "metadata": {
    "_cell_guid": "c21ea1f8-1b22-49ff-b5a3-06e03f455e7f",
    "_uuid": "94a48020-d89a-4a5c-a852-b1feb2cf8f71",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:17.474292Z",
     "iopub.status.busy": "2023-11-03T00:15:17.472738Z",
     "iopub.status.idle": "2023-11-03T00:15:18.510303Z",
     "shell.execute_reply": "2023-11-03T00:15:18.508332Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.064151,
     "end_time": "2023-11-03T00:15:18.512959",
     "exception": false,
     "start_time": "2023-11-03T00:15:17.448808",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Remove \"bad\" data\n",
    "#The data frame includes a few hundred entries when bikes where taken out of docks and checked for quality, where ride_length was negative or \"zero\"\n",
    "trips <- trips[!(trips$ride_length <= 0),]"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "57600fa9",
   "metadata": {
    "_cell_guid": "a6f38aad-1389-4aa5-8dc0-11b6754244d7",
    "_uuid": "b3402a35-6fae-44fe-9f42-f73570b373a3",
    "papermill": {
     "duration": 0.021614,
     "end_time": "2023-11-03T00:15:18.555554",
     "exception": false,
     "start_time": "2023-11-03T00:15:18.533940",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Phase 4: Analyze**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "383fb0dd",
   "metadata": {
    "_cell_guid": "d726c623-054f-4460-af11-dfa90441255a",
    "_uuid": "7b2d93b9-7eb7-4c1f-927a-5c4fbc4b839c",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:18.602292Z",
     "iopub.status.busy": "2023-11-03T00:15:18.600534Z",
     "iopub.status.idle": "2023-11-03T00:15:19.387738Z",
     "shell.execute_reply": "2023-11-03T00:15:19.385824Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.813051,
     "end_time": "2023-11-03T00:15:19.390108",
     "exception": false,
     "start_time": "2023-11-03T00:15:18.577057",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>average_ride_length</th><th scope=col>median_length</th><th scope=col>max_ride_length</th><th scope=col>min_ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1349.8890</td><td>771</td><td>1922127</td><td>1</td></tr>\n",
       "\t<tr><td>member</td><td> 726.1146</td><td>520</td><td>  89872</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " member\\_casual & average\\_ride\\_length & median\\_length & max\\_ride\\_length & min\\_ride\\_length\\\\\n",
       " <chr> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 1349.8890 & 771 & 1922127 & 1\\\\\n",
       "\t member &  726.1146 & 520 &   89872 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 5\n",
       "\n",
       "| member_casual &lt;chr&gt; | average_ride_length &lt;dbl&gt; | median_length &lt;dbl&gt; | max_ride_length &lt;dbl&gt; | min_ride_length &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| casual | 1349.8890 | 771 | 1922127 | 1 |\n",
       "| member |  726.1146 | 520 |   89872 | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual average_ride_length median_length max_ride_length\n",
       "1 casual        1349.8890           771           1922127        \n",
       "2 member         726.1146           520             89872        \n",
       "  min_ride_length\n",
       "1 1              \n",
       "2 1              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Descriptive analysis on ride_length\n",
    "# mean(trips$ride_length) #straight average (total ride length / rides)\n",
    "# median(trips$ride_length) #midpoint number in the ascending array of ride lengths\n",
    "# max(trips$ride_length) #longest ride\n",
    "# min(trips$ride_length) #shortest ride\n",
    "\n",
    "trips %>% \n",
    "group_by(member_casual) %>%\n",
    "summarise(average_ride_length = mean(ride_length),\n",
    "          median_length = median(ride_length), \n",
    "          max_ride_length = max(ride_length), \n",
    "          min_ride_length = min(ride_length))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "5b353cbd",
   "metadata": {
    "_cell_guid": "c151456f-2370-4d2c-93d3-8c1838818e03",
    "_uuid": "9d3557ac-e4c9-4eb2-9a8a-1e311bb94d55",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:19.437431Z",
     "iopub.status.busy": "2023-11-03T00:15:19.435729Z",
     "iopub.status.idle": "2023-11-03T00:15:19.652805Z",
     "shell.execute_reply": "2023-11-03T00:15:19.651010Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.243264,
     "end_time": "2023-11-03T00:15:19.655138",
     "exception": false,
     "start_time": "2023-11-03T00:15:19.411874",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>ride_count</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1675482</td></tr>\n",
       "\t<tr><td>member</td><td>2733268</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & ride\\_count\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & 1675482\\\\\n",
       "\t member & 2733268\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | ride_count &lt;int&gt; |\n",
       "|---|---|\n",
       "| casual | 1675482 |\n",
       "| member | 2733268 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual ride_count\n",
       "1 casual        1675482   \n",
       "2 member        2733268   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Summarise Members and casuals by the total ride taken (ride count)\n",
    "\n",
    "trips %>% \n",
    "    group_by(member_casual) %>% \n",
    "    summarise(ride_count = length(ride_id))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "aba734a4",
   "metadata": {
    "_cell_guid": "f16677e8-de3a-4350-90fa-2b789c674370",
    "_uuid": "cdc0457a-ade1-4d9e-b87b-911051def957",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:19.702300Z",
     "iopub.status.busy": "2023-11-03T00:15:19.700505Z",
     "iopub.status.idle": "2023-11-03T00:15:23.814283Z",
     "shell.execute_reply": "2023-11-03T00:15:23.812574Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 4.139969,
     "end_time": "2023-11-03T00:15:23.816622",
     "exception": false,
     "start_time": "2023-11-03T00:15:19.676653",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>rider type</th><th scope=col>weekday</th><th scope=col>average ride length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>1302.1370</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td> 717.1685</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>1350.0616</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td> 692.2388</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>1533.4342</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td> 822.2206</td></tr>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>1545.8291</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td> 805.5021</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>1181.6240</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td> 697.7933</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>1197.7472</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td> 691.9939</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>1162.3707</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td> 695.9446</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " rider type & weekday & average ride length\\\\\n",
       " <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Friday    & 1302.1370\\\\\n",
       "\t member & Friday    &  717.1685\\\\\n",
       "\t casual & Monday    & 1350.0616\\\\\n",
       "\t member & Monday    &  692.2388\\\\\n",
       "\t casual & Saturday  & 1533.4342\\\\\n",
       "\t member & Saturday  &  822.2206\\\\\n",
       "\t casual & Sunday    & 1545.8291\\\\\n",
       "\t member & Sunday    &  805.5021\\\\\n",
       "\t casual & Thursday  & 1181.6240\\\\\n",
       "\t member & Thursday  &  697.7933\\\\\n",
       "\t casual & Tuesday   & 1197.7472\\\\\n",
       "\t member & Tuesday   &  691.9939\\\\\n",
       "\t casual & Wednesday & 1162.3707\\\\\n",
       "\t member & Wednesday &  695.9446\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 14 × 3\n",
       "\n",
       "| rider type &lt;chr&gt; | weekday &lt;chr&gt; | average ride length &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | Friday    | 1302.1370 |\n",
       "| member | Friday    |  717.1685 |\n",
       "| casual | Monday    | 1350.0616 |\n",
       "| member | Monday    |  692.2388 |\n",
       "| casual | Saturday  | 1533.4342 |\n",
       "| member | Saturday  |  822.2206 |\n",
       "| casual | Sunday    | 1545.8291 |\n",
       "| member | Sunday    |  805.5021 |\n",
       "| casual | Thursday  | 1181.6240 |\n",
       "| member | Thursday  |  697.7933 |\n",
       "| casual | Tuesday   | 1197.7472 |\n",
       "| member | Tuesday   |  691.9939 |\n",
       "| casual | Wednesday | 1162.3707 |\n",
       "| member | Wednesday |  695.9446 |\n",
       "\n"
      ],
      "text/plain": [
       "   rider type weekday   average ride length\n",
       "1  casual     Friday    1302.1370          \n",
       "2  member     Friday     717.1685          \n",
       "3  casual     Monday    1350.0616          \n",
       "4  member     Monday     692.2388          \n",
       "5  casual     Saturday  1533.4342          \n",
       "6  member     Saturday   822.2206          \n",
       "7  casual     Sunday    1545.8291          \n",
       "8  member     Sunday     805.5021          \n",
       "9  casual     Thursday  1181.6240          \n",
       "10 member     Thursday   697.7933          \n",
       "11 casual     Tuesday   1197.7472          \n",
       "12 member     Tuesday    691.9939          \n",
       "13 casual     Wednesday 1162.3707          \n",
       "14 member     Wednesday  695.9446          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# See the average ride time by each day for members vs casual users\n",
    "aggregate(trips$ride_length ~ trips$member_casual + trips$day_of_week, FUN = mean) %>% \n",
    "  setNames(c(\"rider type\",\"weekday\",\"average ride length\"))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "215ab410",
   "metadata": {
    "_cell_guid": "fe693324-4ecb-4a68-a220-69209916cca3",
    "_uuid": "989a4c51-c4fa-4063-be0f-98a3170312a0",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:23.866278Z",
     "iopub.status.busy": "2023-11-03T00:15:23.864571Z",
     "iopub.status.idle": "2023-11-03T00:15:25.305566Z",
     "shell.execute_reply": "2023-11-03T00:15:25.303505Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.468442,
     "end_time": "2023-11-03T00:15:25.308418",
     "exception": false,
     "start_time": "2023-11-03T00:15:23.839976",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Notice that the days of the week are out of order. Let's fix that.\n",
    "trips$day_of_week <- ordered(trips$day_of_week, levels=c(\"Sunday\", \"Monday\", \"Tuesday\", \"Wednesday\", \"Thursday\", \"Friday\", \"Saturday\"))\n",
    "trips$month <- ordered(trips$month, levels=c(\"Jan\", \"Feb\", \"Mar\", \"Apr\", \"May\", \"Jun\", \"Jul\",\"Aug\",\"Sep\",\"Oct\",\"Nov\",\"Dec\"))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "ff54f5b8",
   "metadata": {
    "_cell_guid": "3be4a53d-ace7-41ec-a481-5473d1d2a85c",
    "_uuid": "4d5ac9a3-46e2-4da0-8bd2-407d240625d1",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:25.358464Z",
     "iopub.status.busy": "2023-11-03T00:15:25.356828Z",
     "iopub.status.idle": "2023-11-03T00:15:28.669196Z",
     "shell.execute_reply": "2023-11-03T00:15:28.667440Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 3.340536,
     "end_time": "2023-11-03T00:15:28.672123",
     "exception": false,
     "start_time": "2023-11-03T00:15:25.331587",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>trips$member_casual</th><th scope=col>trips$day_of_week</th><th scope=col>trips$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>1545.8291</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td> 805.5021</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>1350.0616</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td> 692.2388</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>1197.7472</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td> 691.9939</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>1162.3707</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td> 695.9446</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>1181.6240</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td> 697.7933</td></tr>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>1302.1370</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td> 717.1685</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>1533.4342</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td> 822.2206</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " trips\\$member\\_casual & trips\\$day\\_of\\_week & trips\\$ride\\_length\\\\\n",
       " <chr> & <ord> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Sunday    & 1545.8291\\\\\n",
       "\t member & Sunday    &  805.5021\\\\\n",
       "\t casual & Monday    & 1350.0616\\\\\n",
       "\t member & Monday    &  692.2388\\\\\n",
       "\t casual & Tuesday   & 1197.7472\\\\\n",
       "\t member & Tuesday   &  691.9939\\\\\n",
       "\t casual & Wednesday & 1162.3707\\\\\n",
       "\t member & Wednesday &  695.9446\\\\\n",
       "\t casual & Thursday  & 1181.6240\\\\\n",
       "\t member & Thursday  &  697.7933\\\\\n",
       "\t casual & Friday    & 1302.1370\\\\\n",
       "\t member & Friday    &  717.1685\\\\\n",
       "\t casual & Saturday  & 1533.4342\\\\\n",
       "\t member & Saturday  &  822.2206\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 14 × 3\n",
       "\n",
       "| trips$member_casual &lt;chr&gt; | trips$day_of_week &lt;ord&gt; | trips$ride_length &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | Sunday    | 1545.8291 |\n",
       "| member | Sunday    |  805.5021 |\n",
       "| casual | Monday    | 1350.0616 |\n",
       "| member | Monday    |  692.2388 |\n",
       "| casual | Tuesday   | 1197.7472 |\n",
       "| member | Tuesday   |  691.9939 |\n",
       "| casual | Wednesday | 1162.3707 |\n",
       "| member | Wednesday |  695.9446 |\n",
       "| casual | Thursday  | 1181.6240 |\n",
       "| member | Thursday  |  697.7933 |\n",
       "| casual | Friday    | 1302.1370 |\n",
       "| member | Friday    |  717.1685 |\n",
       "| casual | Saturday  | 1533.4342 |\n",
       "| member | Saturday  |  822.2206 |\n",
       "\n"
      ],
      "text/plain": [
       "   trips$member_casual trips$day_of_week trips$ride_length\n",
       "1  casual              Sunday            1545.8291        \n",
       "2  member              Sunday             805.5021        \n",
       "3  casual              Monday            1350.0616        \n",
       "4  member              Monday             692.2388        \n",
       "5  casual              Tuesday           1197.7472        \n",
       "6  member              Tuesday            691.9939        \n",
       "7  casual              Wednesday         1162.3707        \n",
       "8  member              Wednesday          695.9446        \n",
       "9  casual              Thursday          1181.6240        \n",
       "10 member              Thursday           697.7933        \n",
       "11 casual              Friday            1302.1370        \n",
       "12 member              Friday             717.1685        \n",
       "13 casual              Saturday          1533.4342        \n",
       "14 member              Saturday           822.2206        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Now, let's run the average ride time by each day for members vs casual users\n",
    "aggregate(trips$ride_length ~ trips$member_casual + trips$day_of_week, FUN = mean)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "a3115bde",
   "metadata": {
    "_cell_guid": "e3910fd5-11f5-4bec-aedc-85e3814871f9",
    "_uuid": "06277fd1-9cbb-420b-9637-429038e23025",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:28.744215Z",
     "iopub.status.busy": "2023-11-03T00:15:28.741453Z",
     "iopub.status.idle": "2023-11-03T00:15:33.609479Z",
     "shell.execute_reply": "2023-11-03T00:15:33.607774Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 4.908352,
     "end_time": "2023-11-03T00:15:33.612039",
     "exception": false,
     "start_time": "2023-11-03T00:15:28.703687",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 14 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>weekday</th><th scope=col>number_of_rides</th><th scope=col>average_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Sun</td><td>267171</td><td>1545.8291</td></tr>\n",
       "\t<tr><td>casual</td><td>Mon</td><td>189304</td><td>1350.0616</td></tr>\n",
       "\t<tr><td>casual</td><td>Tue</td><td>190132</td><td>1197.7472</td></tr>\n",
       "\t<tr><td>casual</td><td>Wed</td><td>204932</td><td>1162.3707</td></tr>\n",
       "\t<tr><td>casual</td><td>Thu</td><td>219849</td><td>1181.6240</td></tr>\n",
       "\t<tr><td>casual</td><td>Fri</td><td>254704</td><td>1302.1370</td></tr>\n",
       "\t<tr><td>casual</td><td>Sat</td><td>349390</td><td>1533.4342</td></tr>\n",
       "\t<tr><td>member</td><td>Sun</td><td>295383</td><td> 805.5021</td></tr>\n",
       "\t<tr><td>member</td><td>Mon</td><td>376521</td><td> 692.2388</td></tr>\n",
       "\t<tr><td>member</td><td>Tue</td><td>432637</td><td> 691.9939</td></tr>\n",
       "\t<tr><td>member</td><td>Wed</td><td>446131</td><td> 695.9446</td></tr>\n",
       "\t<tr><td>member</td><td>Thu</td><td>438548</td><td> 697.7933</td></tr>\n",
       "\t<tr><td>member</td><td>Fri</td><td>395617</td><td> 717.1685</td></tr>\n",
       "\t<tr><td>member</td><td>Sat</td><td>348431</td><td> 822.2206</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 14 × 4\n",
       "\\begin{tabular}{llll}\n",
       " member\\_casual & weekday & number\\_of\\_rides & average\\_duration\\\\\n",
       " <chr> & <ord> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Sun & 267171 & 1545.8291\\\\\n",
       "\t casual & Mon & 189304 & 1350.0616\\\\\n",
       "\t casual & Tue & 190132 & 1197.7472\\\\\n",
       "\t casual & Wed & 204932 & 1162.3707\\\\\n",
       "\t casual & Thu & 219849 & 1181.6240\\\\\n",
       "\t casual & Fri & 254704 & 1302.1370\\\\\n",
       "\t casual & Sat & 349390 & 1533.4342\\\\\n",
       "\t member & Sun & 295383 &  805.5021\\\\\n",
       "\t member & Mon & 376521 &  692.2388\\\\\n",
       "\t member & Tue & 432637 &  691.9939\\\\\n",
       "\t member & Wed & 446131 &  695.9446\\\\\n",
       "\t member & Thu & 438548 &  697.7933\\\\\n",
       "\t member & Fri & 395617 &  717.1685\\\\\n",
       "\t member & Sat & 348431 &  822.2206\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 14 × 4\n",
       "\n",
       "| member_casual &lt;chr&gt; | weekday &lt;ord&gt; | number_of_rides &lt;int&gt; | average_duration &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | Sun | 267171 | 1545.8291 |\n",
       "| casual | Mon | 189304 | 1350.0616 |\n",
       "| casual | Tue | 190132 | 1197.7472 |\n",
       "| casual | Wed | 204932 | 1162.3707 |\n",
       "| casual | Thu | 219849 | 1181.6240 |\n",
       "| casual | Fri | 254704 | 1302.1370 |\n",
       "| casual | Sat | 349390 | 1533.4342 |\n",
       "| member | Sun | 295383 |  805.5021 |\n",
       "| member | Mon | 376521 |  692.2388 |\n",
       "| member | Tue | 432637 |  691.9939 |\n",
       "| member | Wed | 446131 |  695.9446 |\n",
       "| member | Thu | 438548 |  697.7933 |\n",
       "| member | Fri | 395617 |  717.1685 |\n",
       "| member | Sat | 348431 |  822.2206 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual weekday number_of_rides average_duration\n",
       "1  casual        Sun     267171          1545.8291       \n",
       "2  casual        Mon     189304          1350.0616       \n",
       "3  casual        Tue     190132          1197.7472       \n",
       "4  casual        Wed     204932          1162.3707       \n",
       "5  casual        Thu     219849          1181.6240       \n",
       "6  casual        Fri     254704          1302.1370       \n",
       "7  casual        Sat     349390          1533.4342       \n",
       "8  member        Sun     295383           805.5021       \n",
       "9  member        Mon     376521           692.2388       \n",
       "10 member        Tue     432637           691.9939       \n",
       "11 member        Wed     446131           695.9446       \n",
       "12 member        Thu     438548           697.7933       \n",
       "13 member        Fri     395617           717.1685       \n",
       "14 member        Sat     348431           822.2206       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# analyze ridership data by type and weekday\n",
    "trips %>% \n",
    "  mutate(weekday = wday(started_at, label = TRUE)) %>%  #creates weekday field using wday()\n",
    "  group_by(member_casual, weekday) %>%                  #groups by usertype and weekday\n",
    "  summarise(number_of_rides = n()                       #calculates the number of rides and average duration \n",
    "  ,average_duration = mean(ride_length), ,.groups=\"drop\") %>%            # calculates the average duration\n",
    "  arrange(member_casual, weekday)                       # sorts"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "0fdd1d3b",
   "metadata": {
    "_cell_guid": "ec1f7d76-e0ce-4d12-85f4-3f9e832be319",
    "_uuid": "4e8b6dd7-63db-45c7-8f00-3b7758bfdc35",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:33.660437Z",
     "iopub.status.busy": "2023-11-03T00:15:33.658862Z",
     "iopub.status.idle": "2023-11-03T00:15:33.945910Z",
     "shell.execute_reply": "2023-11-03T00:15:33.944058Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.314087,
     "end_time": "2023-11-03T00:15:33.948412",
     "exception": false,
     "start_time": "2023-11-03T00:15:33.634325",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 24 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>month</th><th scope=col>number_of_rides</th><th scope=col>average_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Jan</td><td> 29618</td><td> 892.8232</td></tr>\n",
       "\t<tr><td>casual</td><td>Feb</td><td> 32774</td><td>1060.4027</td></tr>\n",
       "\t<tr><td>casual</td><td>Mar</td><td> 46786</td><td>1003.2793</td></tr>\n",
       "\t<tr><td>casual</td><td>Apr</td><td>110526</td><td>1357.3867</td></tr>\n",
       "\t<tr><td>casual</td><td>May</td><td>177025</td><td>1471.5850</td></tr>\n",
       "\t<tr><td>casual</td><td>Jun</td><td>219778</td><td>1444.5192</td></tr>\n",
       "\t<tr><td>casual</td><td>Jul</td><td>311649</td><td>1505.7013</td></tr>\n",
       "\t<tr><td>casual</td><td>Aug</td><td>270074</td><td>1397.1418</td></tr>\n",
       "\t<tr><td>casual</td><td>Sep</td><td>220905</td><td>1308.2871</td></tr>\n",
       "\t<tr><td>casual</td><td>Oct</td><td>151312</td><td>1228.1667</td></tr>\n",
       "\t<tr><td>casual</td><td>Nov</td><td> 73533</td><td>1034.8040</td></tr>\n",
       "\t<tr><td>casual</td><td>Dec</td><td> 31502</td><td> 890.5108</td></tr>\n",
       "\t<tr><td>member</td><td>Jan</td><td>118662</td><td> 600.2738</td></tr>\n",
       "\t<tr><td>member</td><td>Feb</td><td>116778</td><td> 625.3519</td></tr>\n",
       "\t<tr><td>member</td><td>Mar</td><td>153647</td><td> 610.2839</td></tr>\n",
       "\t<tr><td>member</td><td>Apr</td><td>213647</td><td> 693.3902</td></tr>\n",
       "\t<tr><td>member</td><td>May</td><td>286162</td><td> 761.6897</td></tr>\n",
       "\t<tr><td>member</td><td>Jun</td><td>314941</td><td> 776.7271</td></tr>\n",
       "\t<tr><td>member</td><td>Jul</td><td>330980</td><td> 810.2364</td></tr>\n",
       "\t<tr><td>member</td><td>Aug</td><td>335201</td><td> 786.4180</td></tr>\n",
       "\t<tr><td>member</td><td>Sep</td><td>314214</td><td> 757.3497</td></tr>\n",
       "\t<tr><td>member</td><td>Oct</td><td>262926</td><td> 700.5410</td></tr>\n",
       "\t<tr><td>member</td><td>Nov</td><td>182219</td><td> 649.6634</td></tr>\n",
       "\t<tr><td>member</td><td>Dec</td><td>103891</td><td> 612.0680</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 24 × 4\n",
       "\\begin{tabular}{llll}\n",
       " member\\_casual & month & number\\_of\\_rides & average\\_duration\\\\\n",
       " <chr> & <ord> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Jan &  29618 &  892.8232\\\\\n",
       "\t casual & Feb &  32774 & 1060.4027\\\\\n",
       "\t casual & Mar &  46786 & 1003.2793\\\\\n",
       "\t casual & Apr & 110526 & 1357.3867\\\\\n",
       "\t casual & May & 177025 & 1471.5850\\\\\n",
       "\t casual & Jun & 219778 & 1444.5192\\\\\n",
       "\t casual & Jul & 311649 & 1505.7013\\\\\n",
       "\t casual & Aug & 270074 & 1397.1418\\\\\n",
       "\t casual & Sep & 220905 & 1308.2871\\\\\n",
       "\t casual & Oct & 151312 & 1228.1667\\\\\n",
       "\t casual & Nov &  73533 & 1034.8040\\\\\n",
       "\t casual & Dec &  31502 &  890.5108\\\\\n",
       "\t member & Jan & 118662 &  600.2738\\\\\n",
       "\t member & Feb & 116778 &  625.3519\\\\\n",
       "\t member & Mar & 153647 &  610.2839\\\\\n",
       "\t member & Apr & 213647 &  693.3902\\\\\n",
       "\t member & May & 286162 &  761.6897\\\\\n",
       "\t member & Jun & 314941 &  776.7271\\\\\n",
       "\t member & Jul & 330980 &  810.2364\\\\\n",
       "\t member & Aug & 335201 &  786.4180\\\\\n",
       "\t member & Sep & 314214 &  757.3497\\\\\n",
       "\t member & Oct & 262926 &  700.5410\\\\\n",
       "\t member & Nov & 182219 &  649.6634\\\\\n",
       "\t member & Dec & 103891 &  612.0680\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 24 × 4\n",
       "\n",
       "| member_casual &lt;chr&gt; | month &lt;ord&gt; | number_of_rides &lt;int&gt; | average_duration &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | Jan |  29618 |  892.8232 |\n",
       "| casual | Feb |  32774 | 1060.4027 |\n",
       "| casual | Mar |  46786 | 1003.2793 |\n",
       "| casual | Apr | 110526 | 1357.3867 |\n",
       "| casual | May | 177025 | 1471.5850 |\n",
       "| casual | Jun | 219778 | 1444.5192 |\n",
       "| casual | Jul | 311649 | 1505.7013 |\n",
       "| casual | Aug | 270074 | 1397.1418 |\n",
       "| casual | Sep | 220905 | 1308.2871 |\n",
       "| casual | Oct | 151312 | 1228.1667 |\n",
       "| casual | Nov |  73533 | 1034.8040 |\n",
       "| casual | Dec |  31502 |  890.5108 |\n",
       "| member | Jan | 118662 |  600.2738 |\n",
       "| member | Feb | 116778 |  625.3519 |\n",
       "| member | Mar | 153647 |  610.2839 |\n",
       "| member | Apr | 213647 |  693.3902 |\n",
       "| member | May | 286162 |  761.6897 |\n",
       "| member | Jun | 314941 |  776.7271 |\n",
       "| member | Jul | 330980 |  810.2364 |\n",
       "| member | Aug | 335201 |  786.4180 |\n",
       "| member | Sep | 314214 |  757.3497 |\n",
       "| member | Oct | 262926 |  700.5410 |\n",
       "| member | Nov | 182219 |  649.6634 |\n",
       "| member | Dec | 103891 |  612.0680 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual month number_of_rides average_duration\n",
       "1  casual        Jan    29618           892.8232       \n",
       "2  casual        Feb    32774          1060.4027       \n",
       "3  casual        Mar    46786          1003.2793       \n",
       "4  casual        Apr   110526          1357.3867       \n",
       "5  casual        May   177025          1471.5850       \n",
       "6  casual        Jun   219778          1444.5192       \n",
       "7  casual        Jul   311649          1505.7013       \n",
       "8  casual        Aug   270074          1397.1418       \n",
       "9  casual        Sep   220905          1308.2871       \n",
       "10 casual        Oct   151312          1228.1667       \n",
       "11 casual        Nov    73533          1034.8040       \n",
       "12 casual        Dec    31502           890.5108       \n",
       "13 member        Jan   118662           600.2738       \n",
       "14 member        Feb   116778           625.3519       \n",
       "15 member        Mar   153647           610.2839       \n",
       "16 member        Apr   213647           693.3902       \n",
       "17 member        May   286162           761.6897       \n",
       "18 member        Jun   314941           776.7271       \n",
       "19 member        Jul   330980           810.2364       \n",
       "20 member        Aug   335201           786.4180       \n",
       "21 member        Sep   314214           757.3497       \n",
       "22 member        Oct   262926           700.5410       \n",
       "23 member        Nov   182219           649.6634       \n",
       "24 member        Dec   103891           612.0680       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# analyze ridership data by type and month\n",
    "trips %>% \n",
    "  group_by(member_casual, month) %>%                  #groups by usertype and month\n",
    "  summarise(number_of_rides = n()                       #calculates the number of rides and average duration \n",
    "  ,average_duration = mean(ride_length),.groups=\"drop\") %>%            # calculates the average duration\n",
    "  arrange(member_casual, month)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7ab31aa8",
   "metadata": {
    "_cell_guid": "6effbe54-7a9f-4d31-9045-61a733b14922",
    "_uuid": "22acbc4b-aff2-47fa-b45d-d10f58162c60",
    "papermill": {
     "duration": 0.023068,
     "end_time": "2023-11-03T00:15:33.994789",
     "exception": false,
     "start_time": "2023-11-03T00:15:33.971721",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Phase 5: Share**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "c0a0f56d",
   "metadata": {
    "_cell_guid": "d80ffbe8-0319-44fe-a235-6eebf2acbe64",
    "_uuid": "a362ea81-9558-4ade-88b1-986cd6890a3b",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:34.044135Z",
     "iopub.status.busy": "2023-11-03T00:15:34.042466Z",
     "iopub.status.idle": "2023-11-03T00:15:39.810079Z",
     "shell.execute_reply": "2023-11-03T00:15:39.808094Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 5.795104,
     "end_time": "2023-11-03T00:15:39.812643",
     "exception": false,
     "start_time": "2023-11-03T00:15:34.017539",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Let's visualize the number of rides by weekdays\n",
    "trips %>% \n",
    "  mutate(weekday = wday(started_at, label = TRUE)) %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(number_of_rides = n()\n",
    "            ,average_duration = mean(ride_length),.groups=\"drop\") %>% \n",
    "  arrange(member_casual, weekday)  %>% \n",
    "  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +\n",
    "  geom_col(position = \"dodge\") +  \n",
    "scale_y_continuous(labels = function(x) format(x, scientific = FALSE)) + # Create a dodged bar plot\n",
    "labs(title = \"Total rides of Members and Casual riders Vs. Day of the week\", x = \"Weekdays\", y = \"Number of rides\")+  \n",
    " scale_fill_discrete(name = \"Rider type\")   #change the legend title"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "720ae94a",
   "metadata": {
    "_cell_guid": "c225ed0b-7822-4e64-82fc-e79e3ef26a20",
    "_uuid": "648830a4-27ff-4985-a714-e7825a913d03",
    "papermill": {
     "duration": 0.023214,
     "end_time": "2023-11-03T00:15:39.859511",
     "exception": false,
     "start_time": "2023-11-03T00:15:39.836297",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "- Members have a higher number of rides on weekdays and lower on weekends. \n",
    "- Casual riders love weekends."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "f0c76f03",
   "metadata": {
    "_cell_guid": "6eeaf62e-7461-4ef4-ab70-86ca4491cbf4",
    "_uuid": "b81f88ab-31d1-4e27-a11b-942df3ef7da6",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:39.911607Z",
     "iopub.status.busy": "2023-11-03T00:15:39.909867Z",
     "iopub.status.idle": "2023-11-03T00:15:40.470433Z",
     "shell.execute_reply": "2023-11-03T00:15:40.468598Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.588643,
     "end_time": "2023-11-03T00:15:40.473048",
     "exception": false,
     "start_time": "2023-11-03T00:15:39.884405",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nk6c+BRsAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# visualization of number of rides by month\n",
    "trips%>% \n",
    "  group_by(member_casual, month) %>% \n",
    "  summarise(number_of_rides = n()\n",
    "            ,average_duration = mean(ride_length),.groups=\"drop\") %>% \n",
    "  arrange(member_casual, month)  %>% \n",
    "  ggplot(aes(x = month, y = number_of_rides, fill = member_casual)) +\n",
    "  geom_col(width=0.5, position = position_dodge(width=0.5)) +\n",
    " scale_y_continuous(labels = function(x) format(x, scientific = FALSE))  +    # Create a dodged bar plot\n",
    " labs(title = \"Monthly rides of Members and Casual riders\", x = \"2022-23\", y = \"Number of rides\")+  \n",
    " scale_fill_discrete(name = \"Rider type\")    #change the legend title"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fe8549f4",
   "metadata": {
    "_cell_guid": "de87eb86-8a87-4841-aeb5-555127903381",
    "_uuid": "b70b54ae-bf58-43e1-a5c9-3fc08fde1b1e",
    "papermill": {
     "duration": 0.024527,
     "end_time": "2023-11-03T00:15:40.522070",
     "exception": false,
     "start_time": "2023-11-03T00:15:40.497543",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Casual riders and members both peak in July, but casual riders drop off more heavily the rest of the year."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "4986aced",
   "metadata": {
    "_cell_guid": "af441464-fe9e-4770-92fa-817c0ac57782",
    "_uuid": "644804a4-362d-42f9-bf47-632533e13cce",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:40.574463Z",
     "iopub.status.busy": "2023-11-03T00:15:40.572825Z",
     "iopub.status.idle": "2023-11-03T00:15:45.803554Z",
     "shell.execute_reply": "2023-11-03T00:15:45.801847Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 5.259958,
     "end_time": "2023-11-03T00:15:45.806255",
     "exception": false,
     "start_time": "2023-11-03T00:15:40.546297",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# visualization for average duration by weekday\n",
    "trips%>% \n",
    "  mutate(weekday = wday(started_at, label = TRUE)) %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(number_of_rides = n()\n",
    "            ,average_duration = mean(ride_length),.groups=\"drop\") %>% \n",
    "  arrange(member_casual, weekday)  %>% \n",
    "  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +\n",
    "  geom_col(position = \"dodge\")+        # Create a dodged bar plot\n",
    "labs(title = \"Average duration by weekday\", x = \"Weekdays\", y = \"Average Duration\")+  \n",
    " scale_fill_discrete(name = \"Rider type\")   #change the legend title"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "25146e3e",
   "metadata": {
    "_cell_guid": "aa0b9989-5feb-416a-a2d1-5352c29c8ebe",
    "_uuid": "f1dff0fb-bff0-4eda-8e23-674dde542fc1",
    "papermill": {
     "duration": 0.025139,
     "end_time": "2023-11-03T00:15:45.856518",
     "exception": false,
     "start_time": "2023-11-03T00:15:45.831379",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "1. Casual riders takes longer trips than annual members.\n",
    "\n",
    "2. **Weekends**: \n",
    "* Both Casual riders and members took longer rides.\n",
    "* The average trip duration of casual riders dropped much more than members on weekdays.\n",
    "* Members were relatively consistent in trip duration."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "3d01f6c9",
   "metadata": {
    "_cell_guid": "a77ae218-b69e-47e0-af06-239cf6fe0ed1",
    "_uuid": "a1c91d17-4b0a-4f72-8499-8c5fd25f04d8",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:45.911453Z",
     "iopub.status.busy": "2023-11-03T00:15:45.909804Z",
     "iopub.status.idle": "2023-11-03T00:15:47.007584Z",
     "shell.execute_reply": "2023-11-03T00:15:47.005841Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.129065,
     "end_time": "2023-11-03T00:15:47.010559",
     "exception": false,
     "start_time": "2023-11-03T00:15:45.881494",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# visualization for average duration by months\n",
    "trips%>% \n",
    "  group_by(member_casual, month) %>% \n",
    "  summarise(number_of_rides = n()\n",
    "            ,average_duration = mean(ride_length),.groups=\"drop\") %>% \n",
    "  arrange(member_casual, month)  %>% \n",
    "  ggplot(aes(x = month, y = average_duration, fill = member_casual)) +\n",
    "  geom_col(position = \"dodge\")+        # Create a dodged bar plot\n",
    "labs(title = \"Average duration by months\", x = \"Months\", y = \"Average duration\")+  \n",
    " scale_fill_discrete(name = \"Rider type\")   #change the legend title"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "6f0a3861",
   "metadata": {
    "_cell_guid": "18f80c95-0b04-44e4-abec-289780223b3f",
    "_uuid": "5bcedfca-0d49-4181-b908-41691301e1b9",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-11-03T00:15:47.066429Z",
     "iopub.status.busy": "2023-11-03T00:15:47.064899Z",
     "iopub.status.idle": "2023-11-03T00:15:55.199785Z",
     "shell.execute_reply": "2023-11-03T00:15:55.197775Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 8.165308,
     "end_time": "2023-11-03T00:15:55.202222",
     "exception": false,
     "start_time": "2023-11-03T00:15:47.036914",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Visualization of Bike Type\n",
    "trips%>% \n",
    "  ggplot(aes(x = member_casual,fill = rideable_type)) +\n",
    "  geom_bar() +     \n",
    "labs(title = \"Bike rides by users\", x = \"Ride type\", y = \"Number of rides\")+ \n",
    "scale_y_continuous(labels = function(x) format(x, scientific = FALSE))  +\n",
    " scale_fill_discrete(name = \"Bike type\")   #change the legend title"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f13a35a4",
   "metadata": {
    "_cell_guid": "0381a93d-4a7c-47f8-9d63-5934537971a0",
    "_uuid": "fd75458c-a566-43c3-bc69-26fe42f655e3",
    "papermill": {
     "duration": 0.026183,
     "end_time": "2023-11-03T00:15:55.254497",
     "exception": false,
     "start_time": "2023-11-03T00:15:55.228314",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "- Members and casual both prefer classic bikes. \n",
    "- Casual were the only riders to make use of docked bikes."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b3e96af3",
   "metadata": {
    "_cell_guid": "f50087fc-f089-4a0a-a1db-6cde041b9cb2",
    "_uuid": "b538c48f-fa21-4e4f-a006-bdc5b89c3f50",
    "papermill": {
     "duration": 0.026611,
     "end_time": "2023-11-03T00:15:55.307449",
     "exception": false,
     "start_time": "2023-11-03T00:15:55.280838",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Phase 6: Act**"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0d3021ee",
   "metadata": {
    "_cell_guid": "4506a589-0d7c-4458-a949-41fedf7e0ab3",
    "_uuid": "a584ede4-25b3-4d09-9d50-202e336e5156",
    "papermill": {
     "duration": 0.027865,
     "end_time": "2023-11-03T00:15:55.362309",
     "exception": false,
     "start_time": "2023-11-03T00:15:55.334444",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Member Vs Casual Behavior\n",
    "\n",
    "**Members**:\n",
    "- Members had higher number of rides all through the year than casual riders.\n",
    "- Members rides more on the weekdays.\n",
    "- Both members and casual riders increase their biking activity during the summer months, members significantly outpace casual riders in terms of total bike rides during the winter season.\n",
    "- Members tend to use bikes for efficient travel with a specific purpose, such as commuting to work or school.\n",
    "\n",
    "**Casual riders**:\n",
    "- Casual riders tend to ride more frequently on weekends and also have longer ride durations compared to members.\n",
    "- In contrast to other months, casual riders exhibited a higher frequency of rides specifically during the month of July.\n",
    "- Only casual riders have experimented with docked bikes.\n",
    "- In colder months, their utilization of bikes experiences a more substantial decline compared to members.\n",
    "- They tend to ride for leisure purposes over the weekend and during warm summer months."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "aa111ffb",
   "metadata": {
    "_cell_guid": "edb6342a-7a04-42ed-8211-637bd11e648d",
    "_uuid": "2495fb47-3f2e-455a-86da-2cf9107418b8",
    "papermill": {
     "duration": 0.027125,
     "end_time": "2023-11-03T00:15:55.416983",
     "exception": false,
     "start_time": "2023-11-03T00:15:55.389858",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## How to convert casual riders to members?\n",
    " \n",
    " ### Recommendations\n",
    " \n",
    "#### Tailored Membership Tiers :\n",
    "* Seasonal Membership: Emphasize the value of annual membership during the summer months when both casual and annual ridership is high. Offer a reduced rate for memberships that span the warm season.\n",
    "* Weekend Warrior Membership: Highlight unlimited weekend rides for casual riders who prefer leisure rides on weekends.\n",
    "* Hybrid Membership: Introduce a hybrid membership that offers a certain number of rides per month at a competitive rate, appealing to casual riders who use bikes for occasional weekday commuting.\n",
    "\n",
    "#### Engaging Seasonal Campaigns:\n",
    "* Summer Sweet Deal:  During the warmer months, promote the annual membership as a cost-effective solution for leisure rides and outdoor exploration. Offer special summer discounts or rewards for signing up.\n",
    "* Winter Warm-Up: Combat the drop in ridership during colder months with exclusive winter-themed perks.\n",
    "\n",
    "#### Refer-a-Friend Program: \n",
    "Leverage the power of social networks by introducing a refer-a-friend program that rewards both existing members and new sign-ups. Casual riders can be incentivized to become members and encourage friends to join with discounts, free rides, or exclusive rewards."
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 106.189493,
   "end_time": "2023-11-03T00:15:55.766098",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-11-03T00:14:09.576605",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
