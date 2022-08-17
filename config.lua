Config = {}

-- coordonée du point + marker + blips
Config.coords = {
	{coordonee = vector3(373.87, 325.89, 103.36)},
}

Config.ped = {

    {name = "mp_m_shopkeep_01", coords = vector3(372.34, 326.53, 102.57), heading = 250.0}
}


Config.shop = {
    {label = ('100$ Baguette'), value = 'bread', price = 100},
    {label = ('150$ Eau'), value = 'water', price = 150},
}

-- si mis sur false le script tourne a 0.01ms constant sinon c'est 0.03ms quand on est a côté du marker
Config.Marker = true

Config.DistanceMarker = 10.0 -- Mettre minimum 5 pour avoir une utilité !