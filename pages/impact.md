---
layout: post
title: "Impact"
description: "Our mission, audience, and impact on the community"
image: /assets/images/oralvision-clinical-use.jpg
show-tile: true
tile_order: 4
---

<!-- Main -->
<div id="main">

<!-- One -->
<section id="one">
	<div class="inner">
		
		<div class="box">
		<p>OralVision is revolutionizing oral diagnostics in underserved communities through <strong>affordable</strong>, <strong>accessible</strong>, and <strong>accurate</strong> deep learning technology. Our mission is to bring life-saving diagnostic capabilities to communities that need them most.</p>
		</div>

		<h3>Customer Segments</h3>

		<p>Our target audience consists of physicians in low-income communities who face significant challenges:</p>

		<table>
			<tr>
				<td>Lack monetary resources to purchase expensive intraoral diagnostic equipment</td>
				<td>Experience frequent faulty diagnoses due to limited diagnostic capabilities</td>
			</tr>
			<tr>
				<td>Serve communities with disproportionately high rates of oral diseases</td>
				<td>Undermine healthcare systems in underserved areas due to diagnostic limitations</td>
			</tr>
		</table>

		<h3>Early Adopters</h3>

		<p>Our adoption strategy follows a carefully planned rollout:</p>

		<ol id="adoption-timeline">
			<li id="timeline-item-1" style="opacity: 0; transform: translateX(-30px);"><strong>Local Medical Professionals</strong>: Our first testers will be local medical professionals who will provide constructive feedback on our product.</li>
			<li id="timeline-item-2" style="opacity: 0; transform: translateX(-30px);"><strong>Nationwide Expansion</strong>: We will expand our customer base to clinics in underserved communities across the nation to streamline logistics.</li>
			<li id="timeline-item-3" style="opacity: 0; transform: translateX(-30px);"><strong>Global Reach</strong>: Ultimately, we will spread worldwide to serve communities globally.</li>
		</ol>

		<h3>Sustainable Advantage</h3>

		<div class="row">
			<div class="6u 12u$(small)">
				<h4>Minimalist Design</h4>
				<p>Our product features a minimalist yet versatile design that remains <strong>cheaper</strong> and <strong>easier to use</strong> than alternatives.</p>
			</div>
			<div class="6u$ 12u$(small)">
				<h4>Continuous Improvement</h4>
				<p>We continuously improve our machine learning algorithm through clinical partnerships where physicians provide HIPAA-compliant training data.</p>
			</div>
		</div>

		<ul class="actions">
			<li><a href="{{ '/info/solution' | relative_url }}" class="button special">Learn About Our Solution</a></li>
			<li><a href="{{ '/info/goals' | relative_url }}" class="button">Our Goals & Strategy</a></li>
		</ul>
	</div>
</section>

</div>

<!-- Anime.js Timeline Animation -->
<script type="module">
	async function loadAnimeJS() {
		// Try multiple CDN sources as fallbacks
		const cdnSources = [
			'https://esm.sh/animejs@4',
			'https://cdn.skypack.dev/animejs@4',
			'https://unpkg.com/animejs@4/lib/anime.es.js'
		];

		for (const source of cdnSources) {
			try {
				const module = await import(source);
				if (module && module.createTimeline) {
					return module.createTimeline;
				}
			} catch (error) {
				console.warn(`Failed to load from ${source}:`, error);
				continue;
			}
		}
		throw new Error('Failed to load anime.js from any CDN source');
	}

	async function initTimeline() {
		const item1 = document.getElementById('timeline-item-1');
		const item2 = document.getElementById('timeline-item-2');
		const item3 = document.getElementById('timeline-item-3');

		if (!item1 || !item2 || !item3) {
			return;
		}

		try {
			const createTimeline = await loadAnimeJS();

			// Create timeline with defaults
			const timeline = createTimeline({
				defaults: { 
					duration: 800,
					easing: 'easeOutExpo'
				},
				autoplay: true
			});

			// Add animations to timeline with staggered timing
			timeline
				.add('#timeline-item-1', {
					opacity: [0, 1],
					x: [-30, 0]
				}, 200)
				.add('#timeline-item-2', {
					opacity: [0, 1],
					x: [-30, 0]
				}, '+=300')
				.add('#timeline-item-3', {
					opacity: [0, 1],
					x: [-30, 0]
				}, '+=300');
		} catch (error) {
			console.error('Failed to initialize timeline animation:', error);
		}
	}

	if (document.readyState === 'loading') {
		document.addEventListener('DOMContentLoaded', initTimeline);
	} else {
		initTimeline();
	}
</script>
