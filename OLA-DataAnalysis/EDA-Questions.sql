# 1. Retrieve all successful bookings:
Create View Successful_Bookings as
Select * from ola.bookings where Booking_Status='Success';

Select * from Successful_Bookings;

# 2. Find the average ride distance for each vehicle type:
Create View Ride_Distance_for_each_Vehicle as
Select Vehicle_Type, Avg(Ride_Distance) as Avg_Distance
from bookings Group by Vehicle_Type;

Select * from ride_distance_for_each_vehicle;

# 3. Get the total number of cancelled rides by customers:
Create View cancelled_rides_by_customers as
Select Count(*) from bookings
Where Booking_Status = 'Canceled by Customer';

# 4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers as
Select Customer_ID, Count(Booking_ID) Total_Rides
from ola.bookings Group by Customer_ID
Order by Total_Rides Desc Limit 5;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_Cancelled_by_Drivers_P_C_Issues as
Select Count(*) from bookings
Where Canceled_Rides_by_Driver = 'Personal & Car related issue';

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating_PS as
Select Max(Driver_Ratings) as max_rating, Min(Driver_Ratings) as min_rating
from bookings where Vehicle_Type = 'Prime Sedan';

# 7. Retrieve all rides where payment was made using UPI:
Create View Payment_UPI as
Select * from bookings where Payment_Method = 'UPI'; 

# 8. Find the average customer rating per vehicle type:
Create View Avg_Customer_Rating as
Select Vehicle_Type, Avg(Customer_Rating) Avg_Customer_Rating
from bookings group by Vehicle_Type;

# 9. Calculate the total booking value of rides completed successfully:
Create View Total_Successful_Ride_Value as
Select Sum(Booking_Value) as Total_Successful_Ride_Value
from ola.bookings where Booking_Status = 'Success';

# 10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason as
Select Booking_ID, Incomplete_Rides_Reason
from ola.bookings where Incomplete_Rides = 'Yes';
