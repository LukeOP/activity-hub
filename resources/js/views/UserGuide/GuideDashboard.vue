<template>
    <div>
        <header id="heading" class="guide-section">
            <h1 id="heading" class="guide-h1">Dashboard</h1>

            <ul class="guide-list">
                <li><a href="#summary">Summary</a></li>
                <li><a href="#tiles">Tiles</a></li>
            </ul>
        </header>

        <section id="summary" class="guide-section">
            <h2 class="guide-h2">Summary</h2>
            <p>The Dashboard is the landing page when you first log in to Activity Hub. It contains key information and a quick reference to the aspects most important to you. This could include lesson and instrument hire information, and  upcoming events.</p>
            <img class="guide-img box-shadow" src="/images/user_guides/dashboard.png" alt="dashboard overview">
            <figure>Example of a user Dashboard.</figure>
            <hr>
        </section>

        <section id="tiles" class="guide-section">
            <h2 class="guide-h2">Tiles</h2>
            <p>Tiles are widgets that provide a quick glance at some key information relating to an area of Activity Hub. Currently, this is broken into two main types of Tiles: Summary Tiles and Action Tiles.</p>
            <h3 class="guide-h3">Summary Tiles</h3>
            <p>Summary Tiles provide a quick glance into some of your statistics in Activity Hub. Currently there are three types of Summary tiles: Instrument Hires, Upcoming Events, and Active Lessons. These can be seen based on application usage and permision access.</p>
            <img class="guide-img box-shadow" src="/images/user_guides/summary_tiles.png" alt="Summary Tiles">
            <figure>Three types of summary tiles providing a quick glance at site statistics.</figure>

            <h3 class="guide-h3">Action Tiles</h3>
            <p>Action Tiles provide more information than a Summary Tile and are interactive. Some examples of existing Action Tiles are the Lessons Tile, and the Events Tile.</p>
            <img class="guide-img box-shadow" src="/images/user_guides/lesson_tile.png" alt="Lesson Tile">
            <figure>An example of a lesson tile that shows the number of scheduled lessons on a given day and what the attendance has been recorded as. Clicking this tile will direct the user to the <a href="./lessons#lesson_planner">Lesson Planner</a> where they can mark attendance and write lesson notes.</figure>
            <img class="guide-img box-shadow" src="/images/user_guides/event_tile.png" alt="Lesson Tile">
            <figure>An example of an events tile showing up to the next 5 events te user is associated with either through linking  or permission access. Notice that an event flag is also visable here.</figure>
        </section>
    </div>
</template>

<script setup>

</script>

<style lang="scss" scoped>

</style>