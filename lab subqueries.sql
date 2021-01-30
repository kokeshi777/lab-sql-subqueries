#Task 1
select count(inventory_id) as stock from inventory
where film_id in (select film_id from  film
where title ='Hunchback Impossible');
#Task 2
select * from film
group by title
having length > (select avg(length) from film)
order by length desc;
# Task 3
select  first_name, last_name from actor
where actor_id in (select actor_id from film_actor
where film_id in (select film_id from film
where title = 'Alone Trip'));
#Task 4
select title from film
where film_id in (select film_id from film_category
where category_id in (select category_id from category
where name='Family'));
#Task 5
select first_name,last_name,email from customer
where address_id in (select address_id from address
where city_id in (select city_id from city
where country_id in (select country_id from country
where country='Canada')));
#Task 6
select title from film
where film_id in (select film_id from film_actor
where actor_id = (select actor_id from film_actor
group by actor_id
order by count(film_id) desc
limit 1));
#Task 7
select film_id from inventory
where inventory_id in  (select inventory_id from rental
where customer_id = (select customer_id from payment
group by customer_id
order by sum(amount) desc
limit 1));
#Task 8
select title from film 
where film_id in (select film_id from inventory
where inventory_id in  (select inventory_id from rental
where customer_id = (select customer_id from payment
group by customer_id
order by sum(amount) desc
limit 1)));
#Task 8
select customer_id, sum(amount) as total_business from payment
group by customer_id
having sum(amount) > (select avg(average) from (select sum(amount) as average from payment
group by customer_id
order by sum(amount) desc)sub1)
order by sum(amount) desc;
