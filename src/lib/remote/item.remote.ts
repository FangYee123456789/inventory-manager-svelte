import { query } from '$app/server';
import type { Item } from '$lib/types/databaseTypes';
import { handleQueryErrors } from '$lib/utils/errorHandling';

export const getItems = query(async () => {
	try {
		await new Promise((resolve) => setTimeout(resolve, 5000));
		return items;
	} catch (e) {
		handleQueryErrors(e);
	}
});

const items: Item[] = [
	{
		id: 1,
		masterNumber: '10734j',
		name: 'Bamboo Memory Foam Pillow',
		category: 'Home',
		supplier: 'Zoombeat',
		quantity: 9475,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/112x100.png/ff4444/ffffff',
		photoUrls: []
	},
	{
		id: 2,
		masterNumber: '12230m',
		name: 'Self-Inflating Camping Mattress',
		category: 'Outdoor',
		supplier: 'JumpXS',
		quantity: 5172,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/169x100.png/dddddd/000000',
		photoUrls: [
			{ item: 'http://dummyimage.com/242x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/203x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/247x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/219x100.png/cc0000/ffffff' }
		]
	},
	{
		id: 3,
		masterNumber: '90489a',
		name: 'Garlic Parmesan Wings',
		category: 'Food - Frozen Foods',
		supplier: 'Voolith',
		quantity: 257,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/169x100.png/cc0000/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/153x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/138x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/175x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/219x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/134x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/151x100.png/cc0000/ffffff' }
		]
	},
	{
		id: 4,
		masterNumber: '75066a',
		name: 'Honey',
		category: 'Food - Condiments',
		supplier: 'Mudo',
		quantity: 9869,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/235x100.png/5fa2dd/ffffff',
		photoUrls: [{ item: 'http://dummyimage.com/149x100.png/cc0000/ffffff' }]
	},
	{
		id: 5,
		masterNumber: '70538d',
		name: 'Organic Whole Grain Oats',
		category: 'Food - Breakfast',
		supplier: 'Twitterbridge',
		quantity: 3708,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/193x100.png/cc0000/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/227x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/124x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/150x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/184x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/158x100.png/ff4444/ffffff' }
		]
	},
	{
		id: 6,
		masterNumber: '24916l',
		name: 'Teriyaki Sauce',
		category: 'Food - Condiments',
		supplier: 'Jayo',
		quantity: 1215,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/164x100.png/cc0000/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/187x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/121x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/220x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/136x100.png/dddddd/000000' }
		]
	},
	{
		id: 7,
		masterNumber: '38309u',
		name: 'Organic Black Beans',
		category: 'Food - Canned Goods',
		supplier: 'Realbridge',
		quantity: 897,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/239x100.png/5fa2dd/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/175x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/138x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/245x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/135x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/163x100.png/dddddd/000000' }
		]
	},
	{
		id: 8,
		masterNumber: '74895q',
		name: 'Bodyweight Resistance Bands',
		category: 'Fitness',
		supplier: 'Skippad',
		quantity: 2383,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/136x100.png/5fa2dd/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/209x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/228x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/221x100.png/cc0000/ffffff' }
		]
	},
	{
		id: 9,
		masterNumber: '95292x',
		name: 'Organic Coconut Oil',
		category: 'Food - Oils',
		supplier: 'Fiveclub',
		quantity: 2048,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/178x100.png/5fa2dd/ffffff',
		photoUrls: []
	},
	{
		id: 10,
		masterNumber: '11432m',
		name: 'Avocados',
		category: 'Food - Produce',
		supplier: 'Jetwire',
		quantity: 5980,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/124x100.png/cc0000/ffffff',
		photoUrls: [{ item: 'http://dummyimage.com/118x100.png/5fa2dd/ffffff' }]
	},
	{
		id: 11,
		masterNumber: '23628q',
		name: 'Almond Joy Protein Bars',
		category: 'Food - Snacks',
		supplier: 'Blogtags',
		quantity: 6932,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/203x100.png/dddddd/000000',
		photoUrls: [{ item: 'http://dummyimage.com/141x100.png/dddddd/000000' }]
	},
	{
		id: 12,
		masterNumber: '82411z',
		name: 'Pesto Pasta Sauce',
		category: 'Food - Sauces',
		supplier: 'Aibox',
		quantity: 998,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/226x100.png/cc0000/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/228x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/115x100.png/dddddd/000000' }
		]
	},
	{
		id: 13,
		masterNumber: '26820m',
		name: 'Mediterranean Couscous',
		category: 'Food - Grains',
		supplier: 'Roomm',
		quantity: 9399,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/171x100.png/dddddd/000000',
		photoUrls: [{ item: 'http://dummyimage.com/226x100.png/cc0000/ffffff' }]
	},
	{
		id: 14,
		masterNumber: '60052l',
		name: 'Fashionable Belt Bag',
		category: 'Accessories',
		supplier: 'Cogibox',
		quantity: 6111,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/134x100.png/5fa2dd/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/250x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/148x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/210x100.png/ff4444/ffffff' }
		]
	},
	{
		id: 15,
		masterNumber: '93935k',
		name: 'Crew Neck Sweater',
		category: 'Clothing - Sweaters',
		supplier: 'Wordpedia',
		quantity: 9120,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/184x100.png/cc0000/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/178x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/233x100.png/cc0000/ffffff' }
		]
	},
	{
		id: 16,
		masterNumber: '42426d',
		name: 'Overnight Hiking Backpack',
		category: 'Outdoor',
		supplier: 'Shuffledrive',
		quantity: 9060,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/230x100.png/dddddd/000000',
		photoUrls: [
			{ item: 'http://dummyimage.com/218x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/202x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/155x100.png/cc0000/ffffff' }
		]
	},
	{
		id: 17,
		masterNumber: '86316p',
		name: 'Sweet Chili Thai Sauce',
		category: 'Food - Condiments',
		supplier: 'Avamba',
		quantity: 4442,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/235x100.png/cc0000/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/215x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/145x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/200x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/179x100.png/ff4444/ffffff' }
		]
	},
	{
		id: 18,
		masterNumber: '45520a',
		name: "Kids' Art Supplies Kit",
		category: 'Toys',
		supplier: 'Ntags',
		quantity: 4476,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/200x100.png/5fa2dd/ffffff',
		photoUrls: [{ item: 'http://dummyimage.com/144x100.png/dddddd/000000' }]
	},
	{
		id: 19,
		masterNumber: '07229s',
		name: 'Herbed Couscous',
		category: 'Food - Grains',
		supplier: 'Avamba',
		quantity: 2513,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/207x100.png/ff4444/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/229x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/121x100.png/ff4444/ffffff' }
		]
	},
	{
		id: 20,
		masterNumber: '27095m',
		name: 'Pet Camera with Treat Dispenser',
		category: 'Pets',
		supplier: 'Meezzy',
		quantity: 4868,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/113x100.png/cc0000/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/208x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/249x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/152x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/237x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/164x100.png/ff4444/ffffff' }
		]
	},
	{
		id: 21,
		masterNumber: '25410z',
		name: 'Sliced Olives',
		category: 'Food - Condiments',
		supplier: 'Thoughtmix',
		quantity: 4625,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/134x100.png/ff4444/ffffff',
		photoUrls: [{ item: 'http://dummyimage.com/143x100.png/dddddd/000000' }]
	},
	{
		id: 22,
		masterNumber: '96262l',
		name: 'Organic Cucumber',
		category: 'Food - Vegetables',
		supplier: 'Feednation',
		quantity: 5922,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/234x100.png/cc0000/ffffff',
		photoUrls: []
	},
	{
		id: 23,
		masterNumber: '67749a',
		name: 'Soft Plush Throw Blanket',
		category: 'Home',
		supplier: 'Oloo',
		quantity: 4227,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/190x100.png/5fa2dd/ffffff',
		photoUrls: [{ item: 'http://dummyimage.com/149x100.png/ff4444/ffffff' }]
	},
	{
		id: 24,
		masterNumber: '13447v',
		name: 'Peach Halves (canned)',
		category: 'Food - Canned Goods',
		supplier: 'Zoonoodle',
		quantity: 8533,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/190x100.png/dddddd/000000',
		photoUrls: [
			{ item: 'http://dummyimage.com/157x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/241x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/125x100.png/cc0000/ffffff' }
		]
	},
	{
		id: 25,
		masterNumber: '63210r',
		name: 'Oatmeal Raisin Cookies',
		category: 'Food - Baked Goods',
		supplier: 'Tagopia',
		quantity: 1573,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/112x100.png/dddddd/000000',
		photoUrls: [
			{ item: 'http://dummyimage.com/178x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/169x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/140x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/220x100.png/5fa2dd/ffffff' }
		]
	},
	{
		id: 26,
		masterNumber: '57598d',
		name: 'Classic Baseball Cap',
		category: 'Clothing - Accessories',
		supplier: 'Twitterbeat',
		quantity: 396,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/236x100.png/ff4444/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/219x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/114x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/107x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/153x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/193x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/135x100.png/dddddd/000000' }
		]
	},
	{
		id: 27,
		masterNumber: '53940o',
		name: 'Foot Spa Bath Massager',
		category: 'Health',
		supplier: 'Youbridge',
		quantity: 9256,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/248x100.png/5fa2dd/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/158x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/109x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/128x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/151x100.png/5fa2dd/ffffff' }
		]
	},
	{
		id: 28,
		masterNumber: '17645h',
		name: 'Butternut Squash Ravioli',
		category: 'Food - Frozen Foods',
		supplier: 'Eayo',
		quantity: 8243,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/111x100.png/5fa2dd/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/249x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/214x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/233x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/228x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/149x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/218x100.png/cc0000/ffffff' }
		]
	},
	{
		id: 29,
		masterNumber: '11868y',
		name: 'Chicken Salad Kit',
		category: 'Food - Prepared Foods',
		supplier: 'Yodel',
		quantity: 824,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/133x100.png/5fa2dd/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/104x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/170x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/104x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/120x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/212x100.png/5fa2dd/ffffff' }
		]
	},
	{
		id: 30,
		masterNumber: '72329z',
		name: 'Leather Wallet',
		category: 'Accessories',
		supplier: 'Digitube',
		quantity: 5710,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/141x100.png/5fa2dd/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/100x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/145x100.png/dddddd/000000' }
		]
	},
	{
		id: 31,
		masterNumber: '41964u',
		name: 'Chicken Broth',
		category: 'Food - Canned Goods',
		supplier: 'Yakitri',
		quantity: 6310,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/204x100.png/dddddd/000000',
		photoUrls: []
	},
	{
		id: 32,
		masterNumber: '77093d',
		name: 'Smartwatch',
		category: 'Wearable Tech',
		supplier: 'Edgeify',
		quantity: 6508,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/187x100.png/5fa2dd/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/208x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/134x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/245x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/196x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/186x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/145x100.png/dddddd/000000' }
		]
	},
	{
		id: 33,
		masterNumber: '76487v',
		name: 'Rustic Italian Breads',
		category: 'Food - Bakery',
		supplier: 'Trudoo',
		quantity: 3537,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/177x100.png/dddddd/000000',
		photoUrls: [
			{ item: 'http://dummyimage.com/135x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/180x100.png/cc0000/ffffff' }
		]
	},
	{
		id: 34,
		masterNumber: '91728l',
		name: 'Ice Cream Maker',
		category: 'Kitchen',
		supplier: 'Jayo',
		quantity: 1556,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/115x100.png/5fa2dd/ffffff',
		photoUrls: [{ item: 'http://dummyimage.com/197x100.png/cc0000/ffffff' }]
	},
	{
		id: 35,
		masterNumber: '39667y',
		name: 'Wireless Music Receiver',
		category: 'Audio',
		supplier: 'Katz',
		quantity: 6655,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/167x100.png/cc0000/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/223x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/157x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/122x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/186x100.png/ff4444/ffffff' }
		]
	},
	{
		id: 36,
		masterNumber: '21541x',
		name: 'Inflatable Party Cooler',
		category: 'Outdoor',
		supplier: 'Youfeed',
		quantity: 534,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/170x100.png/dddddd/000000',
		photoUrls: [
			{ item: 'http://dummyimage.com/247x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/167x100.png/cc0000/ffffff' }
		]
	},
	{
		id: 37,
		masterNumber: '81866w',
		name: 'Siphon Coffee Maker',
		category: 'Kitchen',
		supplier: 'Voonder',
		quantity: 8097,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/226x100.png/cc0000/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/167x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/158x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/101x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/194x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/130x100.png/cc0000/ffffff' }
		]
	},
	{
		id: 38,
		masterNumber: '87686d',
		name: 'Wire Shelving Unit',
		category: 'Home',
		supplier: 'Photolist',
		quantity: 3514,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/133x100.png/dddddd/000000',
		photoUrls: [
			{ item: 'http://dummyimage.com/104x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/242x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/219x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/107x100.png/ff4444/ffffff' }
		]
	},
	{
		id: 39,
		masterNumber: '48759r',
		name: 'Breezy Off-The-Shoulder Top',
		category: 'Clothing - Tops',
		supplier: 'Riffpedia',
		quantity: 1957,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/216x100.png/5fa2dd/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/223x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/186x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/121x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/237x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/132x100.png/dddddd/000000' }
		]
	},
	{
		id: 40,
		masterNumber: '74198x',
		name: 'Tailored Blazer',
		category: 'Clothing - Outerwear',
		supplier: 'Wordpedia',
		quantity: 1337,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/198x100.png/dddddd/000000',
		photoUrls: [
			{ item: 'http://dummyimage.com/123x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/130x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/168x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/131x100.png/ff4444/ffffff' }
		]
	},
	{
		id: 41,
		masterNumber: '78097l',
		name: 'Car Seat Organizer',
		category: 'Automotive',
		supplier: 'Meeveo',
		quantity: 4624,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/225x100.png/ff4444/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/199x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/131x100.png/5fa2dd/ffffff' }
		]
	},
	{
		id: 42,
		masterNumber: '26965q',
		name: 'Silicone Wine Glasses',
		category: 'Outdoor',
		supplier: 'Eazzy',
		quantity: 2852,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/198x100.png/cc0000/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/137x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/192x100.png/cc0000/ffffff' }
		]
	},
	{
		id: 43,
		masterNumber: '10556k',
		name: 'DIY Candle Making Kit',
		category: 'Crafts',
		supplier: 'Zoombox',
		quantity: 3809,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/172x100.png/5fa2dd/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/160x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/156x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/240x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/145x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/206x100.png/cc0000/ffffff' }
		]
	},
	{
		id: 44,
		masterNumber: '19046x',
		name: 'Fitness Balance Ball',
		category: 'Fitness',
		supplier: 'Skyvu',
		quantity: 9152,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/136x100.png/5fa2dd/ffffff',
		photoUrls: [
			{ item: 'http://dummyimage.com/145x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/248x100.png/cc0000/ffffff' },
			{ item: 'http://dummyimage.com/167x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/135x100.png/cc0000/ffffff' }
		]
	},
	{
		id: 45,
		masterNumber: '04546b',
		name: 'Sesame Seeds',
		category: 'Food - Baking',
		supplier: 'Photospace',
		quantity: 2692,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/181x100.png/ff4444/ffffff',
		photoUrls: []
	},
	{
		id: 46,
		masterNumber: '42394m',
		name: 'Mini Air Hockey Table',
		category: 'Toys',
		supplier: 'Photojam',
		quantity: 9093,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/232x100.png/cc0000/ffffff',
		photoUrls: [{ item: 'http://dummyimage.com/102x100.png/dddddd/000000' }]
	},
	{
		id: 47,
		masterNumber: '53552q',
		name: 'Self-Stirring Mug',
		category: 'Kitchen',
		supplier: 'Kimia',
		quantity: 3603,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/174x100.png/dddddd/000000',
		photoUrls: [
			{ item: 'http://dummyimage.com/170x100.png/ff4444/ffffff' },
			{ item: 'http://dummyimage.com/124x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/162x100.png/5fa2dd/ffffff' },
			{ item: 'http://dummyimage.com/206x100.png/dddddd/000000' }
		]
	},
	{
		id: 48,
		masterNumber: '24332c',
		name: 'Mango Chili Salsa',
		category: 'Food - Condiments',
		supplier: 'Topicblab',
		quantity: 8180,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/226x100.png/dddddd/000000',
		photoUrls: [{ item: 'http://dummyimage.com/113x100.png/5fa2dd/ffffff' }]
	},
	{
		id: 49,
		masterNumber: '89999o',
		name: 'Pizza Stone',
		category: 'Kitchen',
		supplier: 'Devbug',
		quantity: 7759,
		isDisabled: false,
		thumbnailUrl: 'http://dummyimage.com/108x100.png/5fa2dd/ffffff',
		photoUrls: [{ item: 'http://dummyimage.com/126x100.png/dddddd/000000' }]
	},
	{
		id: 50,
		masterNumber: '34773q',
		name: 'Flavored Popcorn Mix',
		category: 'Food - Snacks',
		supplier: 'Voomm',
		quantity: 6858,
		isDisabled: true,
		thumbnailUrl: 'http://dummyimage.com/180x100.png/dddddd/000000',
		photoUrls: [
			{ item: 'http://dummyimage.com/180x100.png/dddddd/000000' },
			{ item: 'http://dummyimage.com/193x100.png/cc0000/ffffff' }
		]
	}
];
