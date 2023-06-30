TRIG_PIN = 7
ECHO_PIN = 8

-- trig interval in microseconds (minimun is 10, see HC-SR04 documentation)
TRIG_INTERVAL = 15
-- maximum distance in meters
MAXIMUM_DISTANCE = 10
-- minimum reading interval with 20% of margin
READING_INTERVAL = math.ceil(((MAXIMUM_DISTANCE * 2 / 340 * 1000) + TRIG_INTERVAL) * 1.2)
-- number of readings to average
AVG_READINGS = 3
-- CONTINUOUS MEASURING
CONTINUOUS = false

-- initialize global variables
time_start = 0
time_stop = 0
distance = 0
readings = {}

-- start a measure cycle
function measure()
	readings = {}
	tmr.start(0)
end

-- called when measure is done
function done_measuring()
	print("Distance: "..string.format("%.3f", distance).." Readings: "..#readings)
	if CONTINUOUS then
		node.task.post(measure)
	end
end

-- distance calculation, called by the echo_callback function on falling edge.
function calculate()

	-- echo time (or high level time) in seconds
	local echo_time = (time_stop - time_start) / 1000000

	-- got a valid reading
	if echo_time > 0 then
		-- distance = echo time (or high level time) in seconds * velocity of sound (340M/S) / 2
		local distance = echo_time * 340 / 2
		table.insert(readings, distance)
	end

	-- got all readings
	if #readings >= AVG_READINGS then
		tmr.stop(0)

		-- calculate the average of the readings
		distance = 0
		for k,v in pairs(readings) do
			distance = distance + v
		end
		distance = distance / #readings
		
		node.task.post(done_measuring)
	end
end

-- echo callback function called on both rising and falling edges
function echo_callback(level)
	if level == 1 then
		-- rising edge (low to high)
		time_start = tmr.now()
	else
		-- falling edge (high to low)
		time_stop = tmr.now()
		calculate()
	end
end

-- send trigger signal
function trigger()
	gpio.write(TRIG_PIN, gpio.HIGH)
	tmr.delay(TRIG_INTERVAL)
	gpio.write(TRIG_PIN, gpio.LOW)
end

-- configure pins
gpio.mode(TRIG_PIN, gpio.OUTPUT)
gpio.mode(ECHO_PIN, gpio.INT)

-- trigger timer
tmr.register(0, READING_INTERVAL, tmr.ALARM_AUTO, trigger)

-- set callback function to be called both on rising and falling edges
gpio.trig(ECHO_PIN, "both", echo_callback)




TRIG=7
ECHO=8
local time_start = 0
local time_end = 0


local time_duration = time_end-time_start
local distance_cm = time_duration/58
local distance_inch = time_duration/148


local initSensor = function ()
    gpio.mode(TRIG, gpio.OUTPUT)
    gpio.mode(ECHO, gpio.INPUT)

    gpio.write(TRIG,gpio.LOW)
    print("Waiting For Sensor To Settle...")
    tmr.delay(2000000)
    gpio.write(TRIG,gpio.HIGH)
    tmr.delay(10)
    gpio.write(TRIG,gpio.LOW)

    while gpio.read(ECHO)==0 do
        time_start=tmr.now()
      end

      while gpio.read(ECHO)==1 do
        time_end=tmr.now()
      end 

      print(distance_cm.." cm")
      print(distance_inch.." inch")
end


return initSensor

