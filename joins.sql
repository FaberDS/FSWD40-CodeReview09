-- Get informations of Customer and his license
SELECT customer.first_name,     customer.second_name,
license.from_date,
license.photo FROM customer
LEFT JOIN license on customer.fk_license_id = license.license_id


-- Get the Station Name, Location and Country
SELECT `location`.`location_name`, `location_address`.`zip`, `location_address`.`country` FROM location 
LEFT JOIN location_address ON `location`.`fk_location_address` =`location_address`.`location_address_id`

---- third Query
Select `reservation`.`reservation_id`, `reservation`.`reservation_date`,`vehicle_details`.`fuel_type`, `vehicle_details`.`aircondition`, `customer`.`first_name`, `customer`.`second_name` From reservation
LEFT Join `rents` ON `reservation`.`fk_rents_id` =`rents`.`rents_id`
LEFT JOIn `vehicle` ON `rents`.`fk_vehicle_id` = `vehicle`.`vehicle_id`
LEFT JOIN `vehicle_details`ON `vehicle`.`fk_vehicle_details_id` = `vehicle_details`.`vehicle_details_id`
LEFT JOIN `customer`ON `reservation`.`fk_customer_id` = `customer`.`customer_id`


---- fourth Query
Select `reservation`.`reservation_id`, `reservation`.`reservation_date`, `invoice`.`price`, `vehicle_details`.`vehicle_type` From reservation
LEFT Join `rents` ON `reservation`.`fk_rents_id` =`rents`.`rents_id`
LEFT JOIn `vehicle` ON `rents`.`fk_vehicle_id` = `vehicle`.`vehicle_id`
LEFT JOIN `vehicle_details`ON `vehicle`.`fk_vehicle_details_id` = `vehicle_details`.`vehicle_details_id`
LEFT JOIN `invoice`ON `reservation`.`fk_invoice_id`= `invoice`.`invoice_id`

--fifth 

Select `reservation`.`reservation_id`, `invoice`.`price`, `vehicle_details`.`vehicle_type`, `start_location`.`fk_location_id`, `final_location`.`fk_location_id` From reservation
LEFT Join `rents` ON `reservation`.`fk_rents_id` =`rents`.`rents_id`
LEFT JOIn `vehicle` ON `rents`.`fk_vehicle_id` = `vehicle`.`vehicle_id`
LEFT JOIN `vehicle_details`ON `vehicle`.`fk_vehicle_details_id` = `vehicle_details`.`vehicle_details_id`
LEFT JOIN `invoice`ON `reservation`.`fk_invoice_id`= `invoice`.`invoice_id`
LEFT JOIN `start_location` ON `vehicle`.`fk_start_location_id` = `start_location`.`start_location_id`
LEFT JOIN `final_location` ON `vehicle`.`fk_final_location_id` = `final_location`.`final_location_id`