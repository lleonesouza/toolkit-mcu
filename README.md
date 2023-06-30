# Nodemcu development

stay in hands with

- nodemcu
- data micro-USB cable

⚠️ you will need install these programs before working: ⚠️

- python
- nodejs
- esptool

## Start: 

**Find nodemcu USB port**

```
yarn devices
```

**Copy and Paste inside '.usbport' file**

## Flash firmware on Nodemcu

```
yarn flash
```

## See all commands 


## flash and erase
| TYPE  | URL | DESCRIPTION |
| - | - | - |
| flash | yarn flash | Upload the firmware into the NodeMCU |
| erase | yarn erase | Erase firmware in NodeMCU |

## nodemcu:
| TYPE  | URL | DESCRIPTION |
| - | - | - |
| devices | yarn devices | Find all devices connected |
| start | yarn start | Start project in nodemcu |
| upload | yarn upload | Upload project in nodemcu |
| mkfs | yarn mkfs | Delete all files in nodemcu |
| terminal | /organization | Get a terminal in nodemcu |
| bundle | /organization | Bundle lua files |
| download | /organization | Download files from nodemcu |
| lint | /organization | Lint lua files |


# Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
