# DroneMaster

## Dependencies
* [CocoaPods](https://cocoapods.org/)
* [Alamofire](https://github.com/Alamofire/Alamofire.git)
* [url-image](https://github.com/dmytro-anokhin/url-image.git)
* [ASCollectionView](https://github.com/apptekstudios/ASCollectionView)

## Using the following AWS Services
* EC2
* API Gateway
* Simple Storage Service (S3)
* Simple Queue Service (SQS)
* Rekognition
* DynamoDB
* Lambda

## Start your own HTTP Live Stream Server
Recommended to use [docker](https://github.com/alfg/docker-nginx-rtmp?fbclid=IwAR2WQK0_RA9ycH8AKaK6JPynDyv97iWuXxAf6mmockT7Y809-XV9GjbL9S8)

## Change the constants in [Constant.swift](https://github.com/George0112/DroneMaster/blob/master/MasterDrone/Constants.swift)

* **stream_url** stands for the url of your streaming video, it should be the format as http://example.com/stream
* **api_url** stands for the API gateway or your API server
* **location** stands for the default location of your drone


## Default DynamoDB file format
| id | video_url |
| -------- | -------- |
| String     | String|

You can change the format as long as you also change the swift struct in [Video.swift](https://github.com/George0112/DroneMaster/blob/master/MasterDrone/Models/Video.swift)
