SELECT MENU_ID FROM MENU WHERE MENU_ID = ANY(SELECT Menu_MENU_ID FROM ORDERS WHERE QUANTITY > 1);
