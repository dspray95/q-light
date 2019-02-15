var chunk_size
var current_chunk
var chunks

func _init(chunksize):
	randomize()
	
	self.chunk_size = chunksize
	self.current_chunk = 0	
	self.chunks = []
	
	for i in range(0, 5):
		if i == 0:
			chunks.append(Chunk.new(self.chunk_size, 4))
		else:
			chunks.append(Chunk.new(self.chunk_size, chunks[i - 1].ground[chunks[i-1].ground.size() -1]))
	
	
class Chunk:
	
	var ground
	var roof
	
	func _init(chunk_size, previous_elevation):
		self.ground = []
		self.roof = []
		get_ground(chunk_size, previous_elevation)
	
	func get_ground(chunksize, previous_elevation):
		var variance = 0.2 # how often the ground will change elevation
		var elevation = previous_elevation
		for i in range(0, chunksize - 1):
			var roll = rand_range(0, 1)
			if roll < variance:
				elevation = elevation - 1
			elif roll < variance * 2:
				elevation = elevation + 1
			
			self.ground.append(elevation) 
		print(self.ground)
		hard_smoothing(self.ground)
		print(self.ground)
				
	func hard_smoothing(ground):
		for i in range(0, ground.size() - 1):
			if i > 1 && i < ground.size() - 2:
				if ground[i] > ground[i - 1] and ground[i] > ground[i + 1]:
					ground[i] = ground[i - 1]	
				
			